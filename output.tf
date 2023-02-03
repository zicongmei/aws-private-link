
output "ssh_private" {
  description = "ssh to private instance"
  value       = "ssh -o'UserKnownHostsFile=/dev/null' -o 'StrictHostKeyChecking=no' -J ubuntu@${aws_instance.bastion.public_ip} ubuntu@${aws_instance.private.private_ip}"
}
output "private_role_arn" {
  value = aws_iam_role.private.arn
}