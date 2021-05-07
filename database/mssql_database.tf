resource "aws_db_instance" "main_database" {
  allocated_storage = 20
  engine = "sqlserver-ex"
  engine_version = "15.00.4073.23.v1"
  instance_class = "db.t3.small"
  username = var.mssql_username
  password = var.mssql_password
  skip_final_snapshot = true
  publicly_accessible = true
}