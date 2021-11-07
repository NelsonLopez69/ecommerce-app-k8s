resource "aws_internet_gateway" "jabs-igw" {
    vpc_id = aws_vpc.jabs-vpc.id
    tags = {
        Name = "jabs-igw"
    }
}

resource "aws_route_table" "public-subnet-rt" {
    vpc_id = aws_vpc.jabs-vpc.id
    
    route {
        cidr_block = "0.0.0.0/0" 
        gateway_id = aws_internet_gateway.jabs-igw.id 
    }
    
    tags = {
        Name = "public-subnet-rt"
    }
}

resource "aws_route_table" "private-subnet-rt" {
    vpc_id = aws_vpc.jabs-vpc.id
    
    route {
        cidr_block = "0.0.0.0/0" 
        gateway_id = aws_nat_gateway.jabs-ngw.id 
    }
    
    tags = {
        Name = "private-subnet-rt"
    }
}

resource "aws_route_table_association" "public-subnet-rt-association-1"{
    subnet_id     = aws_subnet.jabs-subnet-public-1.id
    route_table_id = aws_route_table.public-subnet-rt.id
}

resource "aws_route_table_association" "public-subnet-rt-association-2"{
    subnet_id     = aws_subnet.jabs-subnet-public-2.id
    route_table_id = aws_route_table.public-subnet-rt.id
}


resource "aws_route_table_association" "private-subnet-rt-association-1"{
    subnet_id     = aws_subnet.jabs-subnet-private-1.id
    route_table_id = aws_route_table.private-subnet-rt.id
}

resource "aws_route_table_association" "private-subnet-rt-association-2"{
    subnet_id     = aws_subnet.jabs-subnet-private-2.id
    route_table_id = aws_route_table.private-subnet-rt.id
}

resource "aws_eip" "jabs-eip" {
  vpc      = true
  ## depends_on = [aws_nat_gateway.jabs-ngw]
}

resource "aws_nat_gateway" "jabs-ngw" {
  allocation_id = aws_eip.jabs-eip.id
  subnet_id     = aws_subnet.jabs-subnet-public-1.id

  tags = {
    Name = "jabs-gw"
  }

  ## depends_on = [aws_internet_gateway.example]
}