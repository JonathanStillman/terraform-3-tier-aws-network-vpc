# Variable declaration for the AWS region
variable "region" {}

# Variable declaration for the project name
variable "project_name" {}

# Variable declaration for the CIDR block of the VPC
variable "vpc_cidr" {}

# Variable declaration for the CIDR block of the public subnet in Availability Zone 1
variable "public_subnet_az1_cidr" {}

# Variable declaration for the CIDR block of the public subnet in Availability Zone 2
variable "public_subnet_az2_cidr" {}

# Variable declaration for the CIDR block of the private application subnet in Availability Zone 1
variable "private_app_subnet_az1_cidr" {}

# Variable declaration for the CIDR block of the private application subnet in Availability Zone 2
variable "private_app_subnet_az2_cidr" {}

# Variable declaration for the CIDR block of the private data subnet in Availability Zone 1
variable "private_data_subnet_az1_cidr" {}

# Variable declaration for the CIDR block of the private data subnet in Availability Zone 2
variable "private_data_subnet_az2_cidr" {}
