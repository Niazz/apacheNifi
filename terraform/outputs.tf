output "ec2_public_ip" {
  value       = aws_instance.nifi_instance.public_ip
  description = "Public IP Address of EC2 instance"
}

output "ec2_instance_id" {
  value       = aws_instance.nifi_instance.id
  description = "EC2 Instance ID"
}