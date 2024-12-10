module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.30.1"

  cluster_name = "${var.project_name}-eks-cluster"
  cluster_version = "1.31"

  cluster_endpoint_public_access  = var.cluster_endpoint_public_access

  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  enable_irsa = true

  eks_managed_node_groups = {
    workers = {
      min_size = var.workers_min_size
      max_size = var.workers_max_size
      desired_size = var.workers_desired_size

      instance_types = var.workers_instance_types

      iam_role_additional_policies = {
        AmazonEBSCSIDriverPolicy = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
      }
    }
  }

  enable_cluster_creator_admin_permissions = true
}

resource "aws_eks_addon" "addon" {
  addon_name   = "aws-ebs-csi-driver"
  cluster_name = module.eks.cluster_name
  service_account_role_arn = aws_iam_role.ebs_csi_driver_role.arn

  depends_on = [module.eks]
}