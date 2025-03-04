#creating VPC
resource "aws_vpc" "staging" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "stag_vpc"
    }  
}

#subnets
 resource "aws_subnet" "cust_subnet1" {
    vpc_id = aws_vpc.staging.id
    availability_zone = "ap-south-1a"
    cidr_block = "10.0.0.0/24"
    tags = {
      Name = "stag_subnet_1"
    }
 }

 #create internet gateway
 resource "aws_internet_gateway" "stag-1" {
  vpc_id = aws_vpc.staging.id

  tags = {
    Name = "stag-ig-1"
  }
}

#route table
resource "aws_route_table" "stag-1" {
  vpc_id = aws_vpc.staging.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.stag-1.id
  }

  tags = {
    Name = "stag-rt-1"
  }
}

#subnet association
resource "aws_route_table_association" "stag-1" {
    route_table_id = aws_route_table.stag-1.id
    subnet_id = aws_subnet.cust_subnet1.id  
}

#security group
resource "aws_security_group" "allow_tls" {
    name        = "allow_tls"
    vpc_id      = aws_vpc.staging.id
    tags = {
        Name = "dev_sg"
    }
    ingress {
        description      = "TLS from VPC"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }
    ingress {
        description      = "TLS from VPC"
        from_port        = 443
        to_port          = 443
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }
    ingress {
        description      = "TLS from VPC"
        from_port        = 22
        to_port          = 22
        protocol         = "TCP"
        cidr_blocks      = ["0.0.0.0/0"]
        
    }
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        
    }
  }

  #server
  resource "aws_instance" "stag-1" {
    ami = "ami-0d682f26195e9ec0f"
    instance_type = "t2.micro"
    key_name = "multicloudwithdevops-2"
    subnet_id = aws_subnet.cust_subnet1.id
    vpc_security_group_ids = [aws_security_group.allow_tls.id]    
  }


  #private subnet
  resource "aws_subnet" "stag_private" {
    vpc_id = aws_vpc.staging.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-south-1a"
    tags = {
      Name = "private-subnet"
    }    
  }
  # create nat gateway for private subnet
  resource "aws_eip" "stag-nat" {
    domain = "vpc"
  }

  resource "aws_nat_gateway" "stag_pri" {
  allocation_id = aws_eip.stag-nat.id
  subnet_id     = aws_subnet.cust_subnet1.id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
#   depends_on = [aws_internet_gateway.example]
}
  # create route for private subnet and edit routes
  resource "aws_route_table" "stag-pri" {
  vpc_id = aws_vpc.staging.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.stag_pri.id
  }

  tags = {
    Name = "stag-rt-2"
  }
}
  # route table association
  resource "aws_route_table_association" "stag-2" {
    route_table_id = aws_route_table.stag-pri.id
    subnet_id = aws_subnet.stag_private.id  
}