output "bucket_name" {
  value = module.s3_bucket.bucket_name
}

output "ec2_instance_id" {
  value = module.ec2_instance.instance_id
}
