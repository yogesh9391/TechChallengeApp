output "cluster_master_password" {
  value     = module.aurora_cluster.cluster_master_password
  sensitive = true
}

output "cluster_endpoint" {
  value = module.aurora_cluster.cluster_endpoint
}

output "cluster_database_name" {
  value = module.aurora_cluster.cluster_database_name
}

output "cluster_master_username" {
  value = module.aurora_cluster.cluster_master_username
}

output "db_sec_group_id" {
  value = aws_security_group.db_sec_group.id
}

output "node_security_group_id" {
  value = module.go_app_eks.node_security_group_id
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.go_app_vpc.private_subnets
}
