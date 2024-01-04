# Create VPC
resource "aws_vpc" "vpc" {
  cidr_block              = var.vpc_cidr  # Set the desired CIDR block for the VPC
  instance_tenancy        = "default"  # Set the instance tenancy for the VPC
  enable_dns_hostnames    = true

  tags      = {
    Name    = "${var.project_name}-vpc"  # Use the variable "name" to create a unique VPC name
  }
}

# Create Internet Gateway and attach it to VPC
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id    = aws_vpc.vpc.id  # Attach the Internet Gateway to the created VPC

  tags      = {
    Name    = "${var.project_name}-igw"  # Use the variable "name" to create a unique Internet Gateway name
  }
}

# Use data source to get all availability zones in the region
data "aws_availability_zones" "available_zones" {}

# Create public subnet in availability zone 1
resource "aws_subnet" "public_subnet_az1" {
  vpc_id                  = aws_vpc.vpc.id  # Attach the subnet to the created VPC
  cidr_block              = var.public_subnet_az1_cidr  # Set the desired CIDR block for the subnet
  availability_zone       = data.aws_availability_zones.available_zones.names[0]  # Use the first availability zone
  map_public_ip_on_launch = true  # Map public IP on launch for instances in this subnet

  tags      = {
    Name    = "Public-Subnet-AZ1"  # Set a descriptive name for the subnet
  }
}

# Create public subnet in availability zone 2
resource "aws_subnet" "public_subnet_az2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_az2_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[1]  # Use the second availability zone
  map_public_ip_on_launch = true

  tags      = {
    Name    = "Public-Subnet-AZ2"
  }
}

# Create route table and add a public route
resource "aws_route_table" "public_route_table" {
  vpc_id       = aws_vpc.vpc.id  # Attach the route table to the created VPC

  route {
    cidr_block = "0.0.0.0/0"  # Specify the public route
    gateway_id = aws_internet_gateway.internet_gateway.id  # Use the Internet Gateway as the target
  }

  tags       = {
    Name     = "Public-Route-Table"
  }
}

# Associate public subnet in availability zone 1 with the public route table
resource "aws_route_table_association" "public_subnet_az1_route_table_association" {
  subnet_id           = aws_subnet.public_subnet_az1.id
  route_table_id      = aws_route_table.public_route_table.id
}

# Associate public subnet in availability zone 2 with the public route table
resource "aws_route_table_association" "public_subnet_az2_route_table_association" {
  subnet_id           = aws_subnet.public_subnet_az2.id
  route_table_id      = aws_route_table.public_route_table.id
}

# Create private app subnet in availability zone 1
resource "aws_subnet" "private_app_subnet_az1" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = var.private_app_subnet_az1_cidr
  availability_zone        = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch  = false  # Do not map public IP on launch for instances in this subnet

  tags      = {
    Name    = "Private-App-Subnet-AZ1"
  }
}

# Create private app subnet in availability zone 2
resource "aws_subnet" "private_app_subnet_az2" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = var.private_app_subnet_az2_cidr
  availability_zone        = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "Private-App-Subnet-AZ2"
  }
}

# Create private data subnet in availability zone 1
resource "aws_subnet" "private_data_subnet_az1" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = var.private_data_subnet_az1_cidr
  availability_zone        = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "Private-Data-Subnet-AZ1"
  }
}

# Create private data subnet in availability zone 2
resource "aws_subnet" "private_data_subnet_az2" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = var.private_data_subnet_az2_cidr
  availability_zone        = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "Private-Data-Subnet-AZ2"
  }
}
