#This file can be used for automation as it will print terraform console outputs
output "dev_ip" {
  value = aws_instance.dev_node.public_ip
}