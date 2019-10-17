variable "dockeree_license_url" {
  type = string
  description = "URL associated with DockerEE license.  A 1-month trial can be obtained from https://hub.docker.com/editions/enterprise/docker-ee-trial"
}

variable "dockeree_license_file" {
  type = string
  description = "Path to the file containing the DockerEE license, this is provided along with the dockeree_url when obtaining a license."
}

variable "docker_host_ami" {
  type = string
  description = "The Amazon Machine Image for Docker hosts."
}

variable "docker_host_ucp_type" {
  type = string
  description = "The EC2 type to use for UCP hosts."
}

variable "docker_host_dtr_type" {
  type = string
  description = "The EC2 type to use for DTR hosts."
}

