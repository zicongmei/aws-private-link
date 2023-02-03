
output "ssh_private" {
  description = "ssh to private instance"
  value       = "ssh -o'UserKnownHostsFile=/dev/null' -o 'StrictHostKeyChecking=no' -J ubuntu@${aws_instance.bastion.public_ip} ubuntu@${aws_instance.private.private_ip}"
}

output "vpc_endpoint_url" {
  value = aws_vpc_endpoint.this.dns_entry[0]
}

output "vpc_endpoint_id" {
  value = aws_vpc_endpoint.this.id
}
