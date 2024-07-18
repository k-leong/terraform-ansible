output "ec2_ip" {
  value = aws_instance.server[*].public_ip
}