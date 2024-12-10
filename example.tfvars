## GLOBAL ##

project_name = "maxenceb"

## AWS-INFRA ##

workers_min_size = 1
workers_max_size = 3
workers_desired_size = 3
workers_instance_types = ["m5.xlarge"]

vpc_cidr = "10.0.0.0/16"
vpc_azs = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

chart_name = "jfrog-platform"
release_name = "jpd"
repository = "https://charts.jfrog.io"
