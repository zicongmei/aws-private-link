
resource "aws_instance" "private" {

  ami           = data.aws_ami.this.id
  instance_type = local.instance_type
  key_name      = aws_key_pair.this.key_name

  subnet_id = aws_subnet.private.id

  vpc_security_group_ids = [aws_security_group.ssh_only.id]

  root_block_device {
    volume_type = local.volume_type
    volume_size = local.volume_size
  }

  tags = { Name = "${local.name}-private-ec2" }
}

