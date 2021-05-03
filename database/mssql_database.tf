resource "aws_db_instance" "main_database" {
  allocated_storage    = 10
  engine               = "sqlserver-ex"
  engine_version       = "15.00.4073.23.v1"
  instance_class       = "db.t3.small"
  name                 = "UCNBachDatabase"
  username             = "test"
  password             = "test"
  skip_final_snapshot  = true
}