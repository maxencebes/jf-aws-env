variable "cluster_name" {
  description = "Name of the EKS cluster"
  type = string
}

variable "cluster_endpoint" {
  description = "Endpoint of the EKS cluster"
  type = string
}

variable "cluster_ca_certificate" {
  description = "cluster ca certificate"
  type = string
}


variable "chart_name" {
  type = string
  description = "Chart name to install"
}

variable "release_name" {
  type = string
  description = "Release name"
}

variable "namespace" {
  type = string
  description = "The namespace to install the release into"
}

variable "repository" {
  type = string
  description = "Repository URL where to locate the requested chart"
}