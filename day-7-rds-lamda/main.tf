resource "aws_db_instance" "dev" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.sub-grp.id
  tags = {
    Name = "database-2"
  }
}

resource "aws_db_subnet_group" "sub-grp" {
  name       = "main"
  subnet_ids = ["subnet-02529ac322de6bd77", "subnet-08a9129794e00a186"]

  tags = {
    Name = "My DB subnet group"
  }
}