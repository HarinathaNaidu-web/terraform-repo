variable "bucket_name" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "vpc_id" {}
variable "subnet_id" {}
variable "security_group_id" {}
