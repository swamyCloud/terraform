resource "aws_instance" "name" {
    ami = var.ami_id
    instance_type = var.type
    key_name = var.key_name
    availability_zone = "ap-south-1b"
    tags = {
        Name = "devops-1"
    }
}