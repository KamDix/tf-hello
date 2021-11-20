output "instance_public_dns" {
  description = "The public DNS address assigned to the instance."
  value       = aws_instance.ec2_server.public_dns
}
output "private_ip" {
  description = "The private IP address assigned to the instance."
  value       = aws_instance.ec2_server.private_ip
}
output "public_ip" {
  description = "The public IP address assigned to the instance."
  value       = aws_instance.ec2_server.public_ip

}