 resource "aws_instance" "import" {
    ami = "ami-0d682f26195e9ec0f"
    instance_type = "t2.micro"
    key_name = "multicloudwithdevops-2"
    availability_zone = "ap-south-1a"
    tags = {
      Name="Dev-2"
    } 
}


resource "aws_s3_bucket" "import" {
  
}
# terraform import aws_s3_bucket.import "swamydevops-123"
