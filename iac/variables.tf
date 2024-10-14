# iac/acm/variables.tf

variable "domain_name" {
  description = "The fully qualified domain name for the ACM certificate."
  type        = string
  default     = "localstack.dev"
}
