# RDS Subnet Group
resource "aws_db_subnet_group" "this" {
  name       = "${var.rds_db_name}-subnet-group"
  subnet_ids = var.subnet_ids
  tags = {
    Name = "${var.rds_db_name}-subnet-group"
  }
}

# AWS RDS Instance
resource "aws_db_instance" "umami_db" {
  identifier             = var.rds_db_name
  engine                 = "postgres"
  engine_version         = var.engine_version
  instance_class         = var.rds_instance_type
  allocated_storage      = var.rds_allocated_storage
  username               = var.rds_username
  password               = var.rds_password
  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = var.vpc_security_group_ids
  skip_final_snapshot    = true
  publicly_accessible    = true

  depends_on = [aws_db_subnet_group.this]
}

provider "postgresql" {
  alias    = "rds"
  host     = aws_db_instance.umami_db.address
  port     = 5432
  database = "postgres"
  username = var.rds_username
  password = var.rds_password
  sslmode  = "require"
}

resource "postgresql_database" "umami" {
  provider   = postgresql.rds
  name       = var.rds_db_name
  depends_on = [aws_db_instance.umami_db]
}