module "postgres_db" {
  source  = "terraform-aws-modules/rds/aws"
  identifier = "go-app-postgres"

  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage
  storage_type = var.storage_type
  multi_az = var.multi_az
  availability_zone = var.availability_zone

  db_name  = var.db_name
  username = var.user_name
  port     = var.db_port

  iam_database_authentication_enabled = var.iam_database_authentication_enabled


  vpc_security_group_ids = [aws_security_group.db_sec_group.id]

  maintenance_window = var.maintenance_window


  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically
  monitoring_interval = var.monitoring_interval
  monitoring_role_name = var.monitoring_role_name
  create_monitoring_role = var.create_monitoring_role

  tags = {
    Name = "go_app"
  }

  # DB subnet group
  create_db_subnet_group = var.create_db_subnet_group
  #subnet_ids = ["10.0.3.0/24", "10.0.4.0/24"]
  db_subnet_group_name = module.go_app_vpc.database_subnet_group_name


  # DB parameter group
  family = var.family

  # DB option group
  major_engine_version = var.major_engine_version
create_db_option_group = var.create_db_option_group
  # Database Deletion Protection
  deletion_protection = var.deletion_protection
  

}


output "db_instance_address" {
  value = module.postgres_db.db_instance_address
}

output "db_instance_endpoint" {
  value = module.postgres_db.db_instance_endpoint
}

output "db_instance_password" {
  value = module.postgres_db.db_instance_password
  sensitive = true
}

output "db_instance_username" {
  value = module.postgres_db.db_instance_username
  sensitive = true
}
