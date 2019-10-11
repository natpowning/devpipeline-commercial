output "ucp_url" {
  value = "https://${aws_instance.docker_ucp_first.public_ip}"
}

output "dtr_url" {
  value = "https://${aws_instance.docker_dtr_first.public_ip}"
}

