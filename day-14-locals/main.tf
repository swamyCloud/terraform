provider "aws" {
  
}
locals {
  region = "us-east-1"
  environment="dev"
  instance_type = "t2.micro"
  ami=""
  Name="dev"
}

resource "aws_instance" "staging" {
    ami = local.ami
    instance_type = local.instance_type
    
    tags = {
      Name = local.Name
      Environment = local.environment
    }
  
}



#Example 2
# locals {
#   bucket-Name = "${var.layer}-${var-env}-bucket-hydnard"
#   env = "dev"
#   typee = "web"
# }

# resource "aws_s3_bucket" "demo" {
#     bucket = local.bucket-Name
#     tags = {
#       Name = local.Name
#       Environment = local.environment
#     }
# }