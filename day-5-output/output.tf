output "ip" {
    value = aws_instance.staging.public_ip
}
output "privateIp" {
    value = aws_instance.staging.private_ip
    sensitive = true
}