########## db  security group  ##############
variable "db_sec_grp_name" {
  description = "db security group name"
  type        = string
  default     = "db_sec_group"
}

variable "db_sec_grp_from_port" {
  description = "from port"
  type        = number
  default     = 5432
}

variable "db_sec_grp_to_port" {
  description = "to port"
  type        = number
  default     = 5432
}

variable "db_sec_grp_protocol" {
  description = "protocol"
  type        = string
  default     = "tcp"
}
##########   VPC  ##############
variable "vpc_name" {
  description = "vpc name"
  type        = string
  default     = "go_app"
}

# considering only one cidr, but can specify more than one, by changing data type to list.
variable "vpc_cidr" {
  description = "vpc cidr"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "list of AZs"
  type        = list(string)
  default     = ["us-east-2a", "us-east-2b"]
}

variable "private_subnets" {
  description = "list of private subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "database_subnets" {
  description = "list of database subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "create_database_subnet_group" {
  description = "db subnet create"
  type        = bool
  default     = true
}

variable "public_subnets" {
  description = "list of public subnets"
  type        = list(string)
  default     = ["10.0.5.0/24"]
}

variable "enable_nat_gateway" {
  description = "nat gateway"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "single nat gateway"
  type        = bool
  default     = true
}

variable "one_nat_gateway_per_az" {
  description = "single nat gateway per AZ or common"
  type        = bool
  default     = false
}

variable "enable_dns_hostnames" {
  description = "dns hostnames"
  type        = bool
  default     = true
}


variable "enable_dns_support" {
  description = "dns hostnames"
  type        = bool
  default     = true
}


##########   EKS  ##############
variable "cluster_name" {
  description = "cluster name"
  type        = string
  default     = "go_app"
}

variable "cluster_version" {
  description = "cluster version"
  type        = string
  default     = "1.22"
}

variable "private_access" {
  description = "access cluster privately"
  type        = bool
  default     = true
}

variable "public_access" {
  description = "access cluster publicly"
  type        = bool
  default     = true
}

variable "enable_irsa" {
  description = "enable roles for service accounts"
  type        = bool
  default     = true
}

variable "node_group_instance_types" {
  description = "list of instance types for worker nodes"
  type        = list(string)
  default     = ["t2.micro"]
}

variable "node_group_min_size" {
  description = "minimum instances"
  type        = number
  default     = 1
}

variable "node_group_max_size" {
  description = "maximum instances"
  type        = number
  default     = 1
}

variable "node_group_desired_size" {
  description = "desired instances"
  type        = number
  default     = 1
}

variable "node_group_capacity_type" {
  description = "capacity type"
  type        = string
  default     = "ON_DEMAND"
}


##########    RDS    ################

variable "dbcluster_name" {
  description = "db cluster name"
  type        = string
  default     = "go-app-postgres"
}

variable "engine" {
  description = "db engine"
  type        = string
  default     = "aurora-postgresql"
}

variable "engine_version" {
  description = "db engine version"
  type        = string
  default     = "10.17"
}

variable "instance_class" {
  description = "db instance class"
  type        = string
  default     = "db.r5.large"
}

variable "allocated_storage" {
  description = "db storage"
  type        = string
  default     = "20"
}

variable "storage_type" {
  description = "db storage type"
  type        = string
  default     = "gp2"
}

variable "multi_az" {
  description = "multi az"
  type        = bool
  default     = true
}

variable "availability_zone" {
  description = "az"
  type        = string
  default     = "us-east-2a"
}


variable "db_name" {
  description = "db name"
  type        = string
  default     = "app"
}

variable "user_name" {
  description = "user name"
  type        = string
  default     = "postgres"
}

variable "db_port" {
  description = "db port"
  type        = string
  default     = "5432"
}

variable "iam_database_authentication_enabled" {
  description = "authentication using iam"
  type        = bool
  default     = true
}

variable "maintenance_window" {
  description = "maintance window for backup"
  type        = string
  default     = "Mon:00:00-Mon:03:00"
}

variable "monitoring_interval" {
  description = "monitoring interval"
  type        = string
  default     = "30"
}

variable "monitoring_role_name" {
  description = "monitoring role name"
  type        = string
  default     = "DataPocRdsRole"
}

variable "create_monitoring_role" {
  description = "monitoring role"
  type        = bool
  default     = true
}

variable "create_db_subnet_group" {
  description = "monitoring role"
  type        = bool
  default     = false
}

variable "family" {
  description = "db family"
  type        = string
  default     = "postgres10"
}

variable "major_engine_version" {
  description = "db family"
  type        = string
  default     = "10"
}


variable "create_db_option_group" {
  description = "monitoring role"
  type        = bool
  default     = false
}

variable "deletion_protection" {
  description = "monitoring role"
  type        = bool
  default     = false
}
