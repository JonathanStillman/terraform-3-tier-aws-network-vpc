# Configure AWS provider with region and profile settings
provider "aws" {
  region  = var.region  # Set AWS region from variable
  profile = "terraform-user"  # Use the specified AWS CLI profile
}

# Use the VPC module to create the necessary resources
module "VPC" {
  source = "../modules/vpc"  # Set the source path for the VPC module

  # Pass variables to the VPC module for customization
  region                       = var.region
  project_name                 = var.project_name
  vpc_cidr                     = var.vpc_cidr
  public_subnet_az1_cidr       = var.public_subnet_az1_cidr
  public_subnet_az2_cidr       = var.public_subnet_az2_cidr
  private_app_subnet_az1_cidr  = var.private_app_subnet_az1_cidr
  private_app_subnet_az2_cidr  = var.private_app_subnet_az2_cidr
  private_data_subnet_az1_cidr = var.private_data_subnet_az1_cidr
  private_data_subnet_az2_cidr = var.private_data_subnet_az2_cidr
}
