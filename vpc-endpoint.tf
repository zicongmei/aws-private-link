variable "endpoint_service_name" {
  description = "The name of endpoint service that this endpoint is going to connect to."
  type        = string
}


resource "aws_security_group" "endpoint" {
  name        = "${local.name}-endpoint-sg"
  description = "security group for VPC endpoint"
  vpc_id      = aws_vpc.this.id

  ingress {
    description      = "port 80 for traffic"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = { Name = "${local.name}-endpoint-sg" }
}


resource "aws_vpc_endpoint" "this" {
  vpc_id            = aws_vpc.this.id
  service_name      = var.endpoint_service_name
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.endpoint.id,
  ]

  subnet_ids          = [aws_subnet.private.id]
  private_dns_enabled = false

  tags = { Name = "${local.name}-endpoint" }
}