# Output block for the region variable
output "region" {
  value = var.region
}

# Output block for the project_name variable
output "project_name" {
  value = var.project_name
}

# Output block for the VPC ID, extracting it from the aws_vpc resource
output "vpc_id" {
  value = aws_vpc.vpc.id
}

# Output block for the ID of the public subnet in Availability Zone 1
output "public_subnet_az1_id" {
  value = aws_subnet.public_subnet_az1.id
}

# Output block for the ID of the public subnet in Availability Zone 2
output "public_subnet_az2_id" {
  value = aws_subnet.public_subnet_az2.id
}

# Output block for the ID of the private application subnet in Availability Zone 1
output "private_app_subnet_az1_id" {
  value = aws_subnet.private_app_subnet_az1.id
}

# Output block for the ID of the private application subnet in Availability Zone 2
output "private_app_subnet_az2_id" {
  value = aws_subnet.private_app_subnet_az2.id
}

# Output block for the ID of the private data subnet in Availability Zone 1
output "private_data_subnet_az1_id" {
  value = aws_subnet.private_data_subnet_az1.id
}

# Output block for the ID of the private data subnet in Availability Zone 2
output "private_data_subnet_az2_id" {
  value = aws_subnet.private_data_subnet_az2.id
}

# Output block for the ID of the internet gateway variable
output "internet_gateway" {
  value = aws_internet_gateway.internet_gateway.id
}
