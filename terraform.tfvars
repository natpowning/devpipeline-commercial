
#
# Access keys and corresponding secret can be generated and obtained at https://console.aws.amazon.com/iam/home?region=us-west-2#/security_credentials
#
# These can also be set via the environment variables TF_VAR_aws_access_key and TF_VAR_aws_secret_key or entered interactively when executing terraform.
# 
#aws_access_key = ""
#aws_secret_key = ""


#
# Trial license URL and file can be obtained from https://hub.docker.com/editions/enterprise/docker-ee-trial
# 
# This can also be set using TF_VAR_dockeree_license_url environment variable.
#
#dockeree_license_url  = "https://storebits.docker.com/ee/trial/1234"
dockeree_license_file = "docker_subscription.lic"

project_name = "PipelineDemo"

key_name         = "pipeline"
public_key_file  = "~/.ssh/id_rsa.pub"
private_key_file = "~/.ssh/id_rsa"

admin_username = "pipelineadmin"
admin_password = "P@ssw0rd1"

aws_region      = "us-west-2"
docker_host_ami = "ami-01ed306a12b7d1c96"

docker_host_ucp_type    = "t3.large"
docker_host_dtr_type    = "t3.large"
docker_host_worker_type = "t3.micro"


