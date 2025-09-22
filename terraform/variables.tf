variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "project_name" {
  type    = string
  default = "TerraformWeb"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "key_name" {
  type    = string
  default = "Devops_key"
}

variable "public_key_path" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}

variable "git_repo" {
  type    = string
  default = ""
}

variable "my_ip_cidr" {
  type    = string
  default = "0.0.0.0/0"
}
