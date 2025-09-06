output "vpc_id" {
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value       = aws_subnet.private[*].id
}

output "igw_id" {
  value       = aws_internet_gateway.igw.id
}

output "nat_gateway_id" {
  value = var.create_nat_gateway ? aws_nat_gateway.nat[0].id : ""
}

output "public_route_table_id" {
  value       = aws_route_table.public.id
}

output "private_route_table_id" {
  value       = aws_route_table.private.id
}
