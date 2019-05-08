
variable "project_name" {
  description = "Included in object names and as a tag labelled Project."
}

variable "key_name" {
  description = "Name used to create AWS key-pair.  Must be unique for multiple deployments in one AWS account."
}

variable "private_key_file" {
  description = "Location of the file containing private key for ssh authentication."
}

variable "public_key_file" {
  description = "Location of the file containing public key for ssh authentication."
}

variable "admin_username" {
  description = "Username for initially logging into pipeline tools (UCP, DTR, Bamboo, Bitbucket, Jenkins, etc.)"
}

variable "admin_password" {
  description = "Password for admin_username account to initially login to pipeline tools."
}

variable "aws_access_key" {
  description = "The access key for authenticating with AWS API."
}

variable "aws_secret_key" {
  description = "The secret key for authenticating with AWS API."
}

variable "aws_region" {
  description = "The AWS region where the pipeline will be deployed."
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_key_pair" "default" {
  key_name = "${var.key_name}"
  public_key = "${file("${var.public_key_file}")}"
}


