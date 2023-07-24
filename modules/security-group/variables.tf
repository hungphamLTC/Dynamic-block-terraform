variable "name_test" {
  description = "Name for security group resource"
  type        = string
}

variable "description_test" {
  description = "Description for security group resource"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID that the security group resource will be assigned"
  type        = string
}

variable "rules" {
  description = "Security group ingress rules"
  type        = list
  default     = []
}
