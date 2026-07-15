module "eks" {

  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"


  cluster_name = var.cluster_name

  cluster_version = "1.31"


  vpc_id = module.vpc.vpc_id

  subnet_ids = module.vpc.private_subnets


  enable_irsa = true


  cluster_endpoint_public_access = true


  eks_managed_node_groups = {

    bank_nodes = {

      instance_types = [
        var.instance_type
      ]

      min_size     = var.min_nodes
      max_size     = var.max_nodes
      desired_size = var.desired_nodes

    }

  }


  tags = {

    Project = "bank-of-anthos"

  }

}