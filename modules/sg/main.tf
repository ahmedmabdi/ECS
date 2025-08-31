# ECS Service Security Group
resource "aws_security_group" "ecs_sg" {
  name        = "${var.project_name}-ecs-sg"
  description = "Security group for ECS tasks"
  vpc_id      = var.vpc_id

  # Outbound traffic allowed to anywhere (needed for internet access via NAT)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-ecs-sg"
  }
}

# ALB Security Group
resource "aws_security_group" "alb_sg" {
  name        = "${var.project_name}-alb-sg"
  description = "Security group for Application Load Balancer"
  vpc_id      = var.vpc_id

  # Inbound HTTP/HTTPS from allowed IPs
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.allowed_ips
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.allowed_ips
  }

  # Outbound allowed to ECS SG (to send traffic to tasks)
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.ecs_sg.id]
  }

  tags = {
    Name = "${var.project_name}-alb-sg"
  }
}

# ECS SG allows traffic from ALB SG only
resource "aws_security_group_rule" "ecs_ingress_from_alb" {
  type                     = "ingress"
  from_port                = 3000
  to_port                  = 3000
  protocol                 = "tcp"
  security_group_id         = aws_security_group.ecs_sg.id
  source_security_group_id  = aws_security_group.alb_sg.id
}
resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Allow Postgres access"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["82.18.254.202/32"] # replace with your laptop/EC2 public IP
  }

  # Optional: still allow ECS SG traffic
  ingress {
    from_port        = 5432
    to_port          = 5432
    protocol         = "tcp"
    security_groups  = [aws_security_group.ecs_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
