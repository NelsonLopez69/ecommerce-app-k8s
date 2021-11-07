resource "aws_vpc" "jabs-vpc" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"    
    
    tags = {
        Name = "jabs-vpc"
    }
}

resource "aws_subnet" "jabs-subnet-public-1" {
    vpc_id = aws_vpc.jabs-vpc.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true" 
    availability_zone = "us-east-2a"
    tags ={
        Name = "prod-subnet-public-1"
    }
}

resource "aws_subnet" "jabs-subnet-public-2" {
    vpc_id = aws_vpc.jabs-vpc.id
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "true" 
    availability_zone = "us-east-2b"
    tags= {
        Name = "prod-subnet-public-2"
    }
}

resource "aws_subnet" "jabs-subnet-private-1" {
    vpc_id = aws_vpc.jabs-vpc.id
    cidr_block = "10.0.3.0/24"
    map_public_ip_on_launch = "true" 
    availability_zone = "us-east-2a"
    tags ={
        Name = "prod-subnet-public-1"
    }
}

resource "aws_subnet" "jabs-subnet-private-2" {
    vpc_id = aws_vpc.jabs-vpc.id
    cidr_block = "10.0.4.0/24"
    map_public_ip_on_launch = "true" 
    availability_zone = "us-east-2b"
    tags ={
        Name = "prod-subnet-public-1"
    }
}