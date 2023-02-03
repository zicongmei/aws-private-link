variable "endpoint_service_name" {
  description = "The name of endpoint service that this endpoint is going to connect to."
  type        = string
}

resource "aws_vpc_endpoint" "this" {
  vpc_id            = aws_vpc.this.id
  service_name      = var.endpoint_service_name
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.private.id,
  ]

  subnet_ids          = [aws_subnet.private.id]
  private_dns_enabled = false

  tags = { Name = "${local.name}-endpoint" }
}