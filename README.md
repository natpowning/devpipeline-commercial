# Overview

[![Actions Status](https://github.com/natpowning/devpipeline-commercial/workflows/CI/badge.svg)](https://github.com/natpowning/devpipeline-commercial/actions)

Development Pipeline Demo

Terraform scripts and supporting components for deploying a Docker Enterprise Edition cluster with UCP and DTR.

## Getting Started

### Quick-start on OS X or Linux

#### What you need on the host you're deploying from

 - A copy of this repository (git clone https://github.com/natpowning/devpipeline-commercial.git)
 - AWS access and secret key
 - DockerEE license URL and corresponding docker_license.lic file located within the copy of this repository
 - Terraform binary available in your path

Execute this replacing the capital export values with your AWS credentials and DockerEE license URL:
```
export TF_VAR_aws_access_key=AWS_ACCESS_KEY
export TF_VAR_aws_secret_key=AWS_SECRET_KEY
export TF_VAR_dockeree_license_url=LICENSE_URL
terraform init
terraform apply --auto-approve
```


### AWS Access

#### Access Keys

You will need to obtain access and secret keys in order to authenticate with AWS.  They are provided in a file called either credentials.csv or rootkey.csv and can passed into Terraform using one of a few methods: 1) setting environment variables TF_VAR_aws_access_key and TF_VAR_aws_secret_key, enterring manually when executing terraform or 3) added to terraform.tfvars by uncommenting and populating the values for aws_access_key and aws_secret_key.  New keys can be generated at https://console.aws.amazon.com/iam/home?region=us-west-2#/security_credentials

#### Creating an AWS account

Three things are required to create a new AWS account: 1) email address that has not been used in AWS before, 2) a phone number where you can receive text messages and 3) a valid credit card.  Visit https://portal.aws.amazon.com/billing/signup and follow the straight-forward instructions.  This is likely to change as it develops but at the moment all resources used are "Free tier eligible" meaning a new account will not be charged anything for the first year.

### DockerEE License

This implementation uses the enterprise edition of Docker which requires a license including a URL and license file.  You can obtain 30 day trial licenses at https://hub.docker.com, look under "My Content" in the username menu.  The URL can be configured as the environment variable TF_VAR_dockeree_license_url and the file should be placed in the root of this project named docker_license.lic (or a different filename defined as docker_license_file in terraform.tfvars).

### SSH keys

A key-pair is expected to be available at ~/.ssh/id_rsa and ~/.ssh/id_rsa.pub.  Existing keys can be used or you can generate a pair using the OpenSSH command ssh-keygen.  NOTE: the password must be blank.  The key-pair file locations can be changed by updating the private_key_file and public_key_file variables in terraform.tfvars.

### Deploying Base Infrastructure

You must have Terraform installed which is simply a binary that is be placed on your host and made available either by adding to your PATH variable or specifying the full path on each execution.

The following commands are executed in the root of this repository.  Initialize the project by executing:

```
terraform init
```

You can now deploy the environment with:

```
terraform apply --auto-approve
```

To take down the environment execute destroy:

```
terraform destroy --auto-approve
```

