variable "ami_id" {
    description = "inserting ami value"
    type = string
    #default = "ami-0c50b6f7dc3701ddd"      
}

variable "type" {
    type = string
    #default = "t2.micro"  
}

variable "key_name" {
    type = string
    #default = "multicloudwithdevops-2"  
}
