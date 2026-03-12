resource "aws_db_instance" "app_db" {
  identifier             = "rails-db"
  engine                 = "postgres"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  db_subnet_group_name   = module.vpc.database_subnet_group_name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  username            = "admin"
  password            = var.db_password
  skip_final_snapshot = false
}

resource "aws_security_group" "rds_sg" {
  name   = "rds-private-sg"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [module.eks.node_security_group_id]
  }
}
