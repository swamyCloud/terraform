resource "aws_instance" "staging" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    availability_zone = var.availability_zone
    tags = {
      Name: var.tags
    } 
}