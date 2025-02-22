resource "aws_instance" "staging" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    availability_zone = var.availability_zone
    tags = {
      Name: "Dev"
    } 
}

terraform {
  backend "s3" {
    bucket = "swamydevops-123"
    region = "ap-south-1"
    key = "day-5/terraform.tfstate"
    dynamodb_table = "terraform-state-lock-dynamo"
    encrypt = true 
  }
}