output "ucp_url" {
  value = "https://${aws_instance.docker-ucp[0].public_ip}"
}

output "dtr_url" {
  value = "https://${aws_instance.docker-dtr[0].public_ip}"
}

