module "aurora_cluster" {
  source = "terraform-aws-modules/rds-aurora/aws"

  name           = var.dbcluster_name
  engine         = var.engine
  engine_version = var.engine_version
  instance_class = var.instance_class
  instances = {
    one = {}
    2 = {
      instance_class = var.instance_class
    }
  }

  database_name   = var.db_name
  master_username = var.user_name
  port            = var.db_port
  vpc_id          = module.go_app_vpc.vpc_id
  subnets         = module.go_app_vpc.private_subnets

  allowed_security_groups = [module.go_app_eks.node_security_group_id]
  allowed_cidr_blocks     = ["10.0.0.0/16"]
  autoscaling_enabled     = true
  storage_encrypted       = true
  apply_immediately       = true
  monitoring_interval     = 10

  db_parameter_group_name         = "default"
  db_cluster_parameter_group_name = "default"

  enabled_cloudwatch_logs_exports = ["postgresql"]

  tags = {
    project   = "go-app"
    Terraform = "true"
  }
}
