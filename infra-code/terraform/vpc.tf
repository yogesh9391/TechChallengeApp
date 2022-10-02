module "go_app_vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.14.3"
  name = var.vpc_name
  cidr = var.vpc_cidr
  azs = var.azs
  private_subnets = var.private_subnets

  create_database_subnet_group = var.create_database_subnet_group
  database_subnets = var.database_subnets
  public_subnets = var.public_subnets
  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway
  one_nat_gateway_per_az = var.one_nat_gateway_per_az
  enable_dns_hostnames = var.enable_dns_hostnames
  #map_public_ip_on_launch = true
  enable_dns_support = var.enable_dns_support
  tags = {
    Project = "go_app"
  }


}

output "private_subnets" {
description = "List of IDs of private subnets"
value       = module.go_app_vpc.private_subnets
}

resource "aws_security_group" "db_sec_group" {
  name        = var.db_sec_grp_name
  description = "RDS security group"
  vpc_id      = module.go_app_vpc.vpc_id
  ingress {
    description      = "EKS pods to RDS"
    from_port        = var.db_sec_grp_from_port
    to_port          = var.db_sec_grp_to_port
    protocol         = var.db_sec_grp_protocol
    security_groups      = [module.go_app_eks.node_security_group_id]

  }
}

output "db_sec_group_id" {
  value = aws_security_group.db_sec_group.id
}
