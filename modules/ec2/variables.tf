variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}
variable "subnet_id" {
  description = "Subnet ID"
}

variable "security_group_id" {
  description = "Security Group ID"
}
