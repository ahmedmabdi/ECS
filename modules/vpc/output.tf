output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the main VPC"
}

output "public_subnet_ids" {
  value       = aws_subnet.public[*].id
  description = "List of public subnet IDs"
}

output "private_subnet_ids" {
  value       = aws_subnet.private[*].id
  description = "List of private subnet IDs"
}

output "igw_id" {
  value       = aws_internet_gateway.igw.id
  description = "Internet Gateway ID for the public subnets"
}

output "nat_gateway_id" {
  value = var.create_nat_gateway ? aws_nat_gateway.nat[0].id : ""
}

output "public_route_table_id" {
  value       = aws_route_table.public.id
  description = "Public route table ID"
}

output "private_route_table_id" {
  value       = aws_route_table.private.id
  description = "Private route table ID"
}
