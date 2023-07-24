variable "vpc_cidr" {}

variable "area_code" {}

variable "public_cidr" {}

variable "name" {
  description = "Name for security group resource"
  type        = string
}

variable "description" {
  description = "Description for security group resource"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID that the security group resource will be assigned"
  type        = string
  default     = null
}
