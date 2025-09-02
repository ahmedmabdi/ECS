resource "aws_db_instance" "umami_db" {
  identifier            = var.db_name
  engine                = "postgres"
  instance_class        = var.instance_type
  allocated_storage     = var.allocated_storage
  username              = var.username
  password              = var.password
  db_subnet_group_name  = aws_db_subnet_group.this.name
  vpc_security_group_ids = var.vpc_security_group_ids
  skip_final_snapshot = true

  publicly_accessible   = true

  depends_on = [aws_db_subnet_group.this]
}

resource "aws_db_subnet_group" "this" {
  name       = "${var.db_name}-subnet-group"
  subnet_ids = var.subnet_ids  # pass in both private subnets
  tags = {
    Name = "${var.db_name}-subnet-group"
  }
}
