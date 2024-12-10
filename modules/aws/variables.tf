variable "project_name" {
  description = "project_name"
  type = string
  default = "maxenceb"
}

variable "cluster_endpoint_public_access" {
  type = bool
  description = "Indicate whether or not the AWS EKS public API server endpoint is enabled"
}

variable "workers_min_size" {
  type = number
  description = "EKS managed node group min size"
}

variable "workers_max_size" {
  type = number
  description = "EKS managed node group max size"
}

variable "workers_desired_size" {
  type = number
  description = "EKS managed node group desired size"
}

variable "workers_instance_types" {
  type = list(string)
  description = "EKS managed nodes instance types"
}

variable "vpc_cidr" {
  type = string
  description = "VPC CIDR block"
}

variable "vpc_azs" {
  type = list(string)
  description = "Availability zones"
}

variable "private_subnets" {
  type = list(string)
  description = "Private subnets CIDR blocks"
}

variable "public_subnets" {
  type = list(string)
  description = "Public subnets CIDR blocks"
}