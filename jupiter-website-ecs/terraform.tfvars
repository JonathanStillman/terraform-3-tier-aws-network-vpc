# Define variables for the AWS region and project name
region = "us-east-1"  # Specify the desired AWS region
project_name = "jupiter"  # Set the project name for resource naming

# Define CIDR blocks for VPC and subnets
vpc_cidr = "10.0.0.0/16"  # Set the CIDR block for the VPC

public_subnet_az1_cidr = "10.0.0.0/24"  # CIDR block for public subnet in AZ1
public_subnet_az2_cidr = "10.0.1.0/24"  # CIDR block for public subnet in AZ2

private_app_subnet_az1_cidr = "10.0.2.0/24"  # CIDR block for private app subnet in AZ1
private_app_subnet_az2_cidr = "10.0.3.0/24"  # CIDR block for private app subnet in AZ2

private_data_subnet_az1_cidr = "10.0.4.0/24"  # CIDR block for private data subnet in AZ1
private_data_subnet_az2_cidr = "10.0.5.0/24"  # CIDR block for private data subnet in AZ2
