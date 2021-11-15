output "websinstance" {
    description = "info about pub ec2"
    value = aws_instance.web_server[*].public_ip
  locals {
    key  = value
  }
  
}

output "webinstance" {
    description = "info about the dns"
    value = aws_instance.web_server[*].public_ip
}
