module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.15.0"

  name = "${var.project_name}-vpc"
  cidr = var.vpc_cidr

  azs = var.vpc_azs
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  enable_nat_gateway = true

}