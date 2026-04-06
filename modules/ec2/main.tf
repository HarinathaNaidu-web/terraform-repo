module "ec2_instance_id" {
  source        = "./modules/ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
}
