module "aws-infra" {
  source = "./modules/aws"

  cluster_endpoint_public_access = var.cluster_endpoint_public_access
  vpc_cidr = var.vpc_cidr
  vpc_azs = var.vpc_azs
  private_subnets = var.private_subnets
  public_subnets = var.public_subnets

  workers_min_size = var.workers_min_size
  workers_max_size = var.workers_max_size
  workers_desired_size = var.workers_desired_size
  workers_instance_types = var.workers_instance_types
}

module "helm" {
  source = "./modules/helm"

  cluster_name = module.aws-infra.cluster_name
  cluster_endpoint = module.aws-infra.cluster_endpoint
  cluster_ca_certificate = module.aws-infra.cluster_certificate_authority_data

  chart_name = var.chart_name
  namespace = var.namespace
  release_name = var.release_name
  repository = var.repository
}