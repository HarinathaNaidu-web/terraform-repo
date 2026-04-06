
resource "aws_instance" "test" {
  ami           = "ami-0c2d3e23c2b8d84f0"  # Amazon Linux 2023 - us-west-2
  instance_type = "t2.micro"

  tags = {
    Name = "test-instance"
  }
}
