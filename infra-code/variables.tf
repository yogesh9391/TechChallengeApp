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
  type = list(string)
  default = ["us-east-2a", "us-east-2b"]
}

variable "private_subnets" {
  description = "list of private subnets"
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "database_subnets" {
  description = "list of database subnets"
  type = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "create_database_subnet_group" {
  description = "db subnet create"
  type = bool
  default = true
}

variable "public_subnets" {
  description = "list of public subnets"
  type = list(string)
  default = ["10.0.5.0/24"]
}

variable "enable_nat_gateway" {
  description = "nat gateway"
  type = bool
  default = true
}

variable "single_nat_gateway" {
  description = "single nat gateway"
  type = bool
  default = true
}

variable "one_nat_gateway_per_az" {
  description = "single nat gateway per AZ or common"
  type = bool
  default = false
}

variable "enable_dns_hostnames" {
  description = "dns hostnames"
  type = bool
  default = true
}


variable "enable_dns_support" {
  description = "dns hostnames"
  type = bool
  default = true
}
