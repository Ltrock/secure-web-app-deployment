# outputs.tf
output "web_instance_public_ip" {
  description = "The public IP of the web server"
  value       = aws_instance.web.public_ip
}

output "web_acl_arn" {
  description = "The ARN of the Web ACL"
  value       = aws_wafv2_web_acl.web_acl.arn
}
