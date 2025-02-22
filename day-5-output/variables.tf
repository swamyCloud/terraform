variable "ami_id" {
    type = "string"
    default = "ami-0d682f26195e9ec0f" 
}
variable "instance_type" {
    type = "string"
    default = "t2.micro"  
}
variable "key_name" {
    type = "string"
    default = "multicloudwithdevops-2"  
}
variable "availability_zone" {
    type = "string"
    default = "ap-south-1a"  
}