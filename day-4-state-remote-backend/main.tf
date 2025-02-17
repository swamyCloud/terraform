# resource "aws_instance" "name" {
#     ami = var.ami_id
#     instance_type = var.type
#     key_name = var.key_name
#     availability_zone = "ap-south-1b"
#     tags = {
#         Name = "devops-1"
#     }
# }


resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "terraform-state-lock-dynamo"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
}

# resource "aws_s3_bucket" "name" {
#     bucket = "swamydevops-123"
  
# }