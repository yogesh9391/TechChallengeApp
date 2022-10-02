module "go_app_eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 18.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  cluster_endpoint_private_access = var.private_access
  cluster_endpoint_public_access  = var.public_access

  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {}
    vpc-cni = {
      resolve_conflicts = "OVERWRITE"
    }
  }

  vpc_id     = module.go_app_vpc.vpc_id
  #subnet_ids = ["subnet-0b7926c5484715de3","subnet-05e210bd708ed8741"]
  subnet_ids = module.go_app_vpc.private_subnets
  enable_irsa = var.enable_irsa

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    disk_size      = 10
    instance_types = var.node_group_instance_types
  }
  create_cloudwatch_log_group = false
  eks_managed_node_groups = {
    go_app_first = {
      min_size     = var.node_group_min_size
      max_size     = var.node_group_max_size
      desired_size = var.node_group_desired_size
      instance_types = var.node_group_instance_types
      capacity_type  = var.node_group_capacity_type
      labels = {
        project = "data-poc"
      }
    }
  }
}

output "node_security_group_id" {
  value = module.go_app_eks.node_security_group_id
}
