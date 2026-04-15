module "ec2_instance" {
  source = "./modules/ec2"

  ami_id        = var.ami_id
  instance_type = var.instance_type

  subnet_id         = var.subnet_id
  security_group_id = var.security_group_id
}

module "s3_bucket" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}


