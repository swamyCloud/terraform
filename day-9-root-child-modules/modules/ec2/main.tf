resource "aws_instance" "this" {
  ami           = "ami-0c50b6f7dc3701ddd"
  instance_type = var.instance_type

  tags = {
    Name = "Terraform-EC2"
  }
}
