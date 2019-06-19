output "aws_region" {
  value = var.aws_region
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnet_id" {
  value = aws_subnet.vpc.id
}
