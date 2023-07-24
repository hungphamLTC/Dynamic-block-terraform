resource "aws_security_group" "main" {
  name        = var.name_test
  description = var.description_test
  vpc_id      = var.vpc_id

  dynamic "ingress"{
    for_each = var.rules

    content {
        description = ingress.value.description
        from_port   = ingress.value.from_port
        to_port     = ingress.value.to_port
        protocol    = ingress.value.protocol
        cidr_blocks = ingress.value.cidr_blocks
    }
  }
}
