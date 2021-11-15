# Create VPC
# terraform aws create vpc
resource "aws_vpc" "testvpc" {
  cidr_block              = "${var.vpc-cidr}"
  instance_tenancy        = "default"
  enable_dns_hostnames    = true
  enable_dns_support      = true
  tags      = {
    Name    = "testvpc"
  }
}


# terraform aws create internet gateway
resource "aws_internet_gateway" "testigw" {
  vpc_id    = aws_vpc.testvpc.id

  tags      = {
    Name    = "testigw"
  }
}


#Create Public Subnet 1
# terraform aws create subnet
resource "aws_subnet" "public-subnet-1" {
  vpc_id                  = aws_vpc.testvpc.id
  cidr_block              = "${var.public-subnet-1-cidr}"
  availability_zone       = "us-west-1a"
  map_public_ip_on_launch = true

  tags      = {
    Name    = "PublicSubnet1"
  }
}



# Create Route Table and Add Public Route
# terraform aws create route table
resource "aws_route_table" "public-route-table" {
  vpc_id       = aws_vpc.testvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.testigw.id
  }

  tags       = {
    Name     = "PublicRouteTable"
  }
}


# Associate Public Subnet 1 to "Public Route Table"
# terraform aws associate subnet with route table
resource "aws_route_table_association" "public-subnet-1-route-table-association" {
  subnet_id           = aws_subnet.public-subnet-1.id
  route_table_id      = aws_route_table.public-route-table.id
}


# Create Private Subnet 1
# terraform aws create subnet
resource "aws_subnet" "private-subnet-1" {
  vpc_id                   = aws_vpc.testvpc.id
  cidr_block               = "${var.private-subnet-1-cidr}"
  availability_zone        = "us-west-1a"
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "PrivateSubnet1"
  }
}


# Create Route Table and Add Private Route
# terraform aws create route table
resource "aws_route_table" "private-route-table" {
  vpc_id       = aws_vpc.testvpc.id

  tags       = {
    Name     = "PrivateRouteTable"
  }
}

# Associate Private Subnet 1 to "PrivateRoute Table"
# terraform aws associate subnet with route table
resource "aws_route_table_association" "private-subnet-1-route-table-association" {
  subnet_id           = aws_subnet.private-subnet-1.id
  route_table_id      = aws_route_table.private-route-table.id
}

#data source 
data "aws_ami" "amazon-linux1" {
  most_recent = true
  owners = [ "amazon" ]
  #set a filter to fetch the latest ami 
filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}



