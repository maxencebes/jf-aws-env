## Global ##

variable "project_name" {
  type = string
  description = "Project name"
}

## AWS-INFRA ##

variable "cluster_endpoint_public_access" {
  type = bool
  description = "Indicatr whether or not the AWS EKS public API server endpoint is enabled"
  default = true
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

## Helm ##

variable "namespace" {
  type = string
  description = "The namespace to install the release into"
  default = "default"
}

variable "chart_name" {
  type = string
  description = "Chart name to install"
}

variable "release_name" {
  type = string
  description = "Release name"
}

variable "repository" {
  type = string
  description = "Repository URL where to locate the requested chart"
}