# iac/acm/variables.tf

variable "email" {
  description = "email address for verification with letsencrypt"
  type        = string
  default     = "noop@example.com"
  validation {
    condition = can(regex("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", var.email))
    error_message = "The email address must be in a valid format (e.g., user@example.com)."
  }
}

variable "app_namespace" {
  description = "app namespace"
  type        = string
  default     = "application"
}

variable "cert_manager_namespace" {
  description = "cert-manager namespace"
  type        = string
  default     = "cert-manager"
}

variable "prometheus_namespace" {
  description = "prometheus namespace"
  type        = string
  default     = "prometheus"
}


variable "aws_profile" {
  description = "defines the aws profile to use (e.g. localstack)"
  type        = string
  default     = "localstack"
}

variable "domain_name" {
  description = "The fully qualified domain name for the ACM certificate."
  type        = string
  default     = "localhost.localstack.cloud"
}

variable "region" {
  description = "The AWS region"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR address of VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_az" {
  description = "primary availability zone"
  type        = string
  default     = "us-east-1a"
}

variable "subnet_app_cidr" {
  description = "CIDR address for the Application subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "subnet_eks_cidr" {
  description = "CIDR address for the EKS cluster"
  type        = string
  default     = "10.0.3.0/24"
}

variable "repository_name" {
  description = "The name of the ECR repository"
  type        = string
  default     = "repo"
}

variable "nginx_ingress_replicas" {
  description = "number of nginx ingress replicas"
  type        = number
  default     = 3
}