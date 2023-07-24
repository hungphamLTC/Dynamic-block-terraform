data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["main"]
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.2"

  name               = "main"
  cidr               = var.vpc_cidr
  azs                = data.aws_availability_zones.available.names[*]
  public_subnets     = var.public_cidr
  enable_nat_gateway = false

  tags = {
    Name = "main"
  }
}

module "sg" {
  source = "./modules/security-group"

  name_test        = var.name
  description_test = var.description
  vpc_id           = data.aws_vpc.selected.id

  rules = [
    {
      description = "TLS"
      from_port   = 443
      to_port     = 443
      protocol    = "TCP"
      cidr_blocks = ["85.76.117.12/32"]
    },
    {
      description = "SSH"
      from_port   = 22
      to_port     = 22
      protocol    = "TCP"
      cidr_blocks = ["85.76.117.12/32"]
    }
  ]
}
