resource "aws_db_instance" "rds-instance" {
  allocated_storage    = 10
  db_name              =  "${local.env}-rds"
  engine               = "postgres"
  engine_version       = "15.8"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_subnet.private_zone1.id
}