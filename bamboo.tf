

resource "null_resource" "build-and-deploy-bamboo" {
  connection {
    type        = "ssh"
    host        = "${element(aws_instance.docker-ucp.*.public_ip, 0)}"
    user        = "centos"
    private_key = "${file("${var.private_key_file}")}"
    agent       = false
  }

  provisioner "file" {
    source = "bamboo-server"
    destination = "/tmp/bamboo-server-build"
  }

  provisioner "remote-exec" {
    inline = [
# Build bootstrap bamboo image
      "sudo docker build /tmp/bamboo-server-build -t ${aws_instance.docker-dtr.private_dns}/vesta/bamboo",

# Get API token for DTR
#      "curl -sk --form-string username=pipelineadmin --form-string password=P@ssw0rd1 -c dtr_auth.cookie https://${aws_instance.docker-dtr.private_ip}/login_submit",
#      "curl -sk -b dtr_auth.cookie -d '{tokenLabel: \"test\"}' --form-string username=pipelineadmin -H 'X-Csrf-Token: 0099f99c-3156-49ef-b7b8-3a6d3ea7f758' https://${aws_instance.docker-dtr.private_ip}/api/v0/api_tokens/?username=pipelineadmin"
    ]
  }

  depends_on = [
    "aws_instance.docker-dtr",
    "aws_instance.docker-worker"
  ]
}

