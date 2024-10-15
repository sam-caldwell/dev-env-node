# iac/acm/variables.tf

variable "domain_name" {
  description = "The fully qualified domain name for the ACM certificate."
  type        = string
  default     = "localstack.dev"
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
variable "vpc_az1" {
  description = "az1"
  type        = string
  default     = "us-east-1a"
}
variable "vpc_az2" {
  description = "az2"
  type        = string
  default     = "us-east-1b"
}
variable "vpc_az3" {
  description = "az3"
  type        = string
  default     = "us-east-1c"
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

variable "subnet_redis_cidr" {
  description = "CIDR address of ElasticCache Redis Cluster (see /29s subnets, later)"
  type        = string
  default     = "10.0.1.0/24"
}


variable "subnet_redis_cidr1" {
  description = "az1 subnet"
  type        = string
  default     = "10.0.1.0/29"
}

variable "subnet_redis_cidr2" {
  description = "az2 subnet"
  type        = string
  default     = "10.0.1.8/29"
}

variable "subnet_redis_cidr3" {
  description = "az3 subnet"
  type        = string
  default     = "10.0.1.16/29"
}

variable "redis_port" {
  description = "The tcp port used by redis to connect"
  type        = number
  default     = 6379
}

variable "repository_name" {
  description = "The name of the ECR repository"
  type        = string
  default     = "repo"
}

variable "nginx_ingress_replicas" {
  description = "number of nginx ingress replicas"
  type = number
  default = 3
}