provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "demo" {
  ami           = "ami-0ea0f0aecf4b692ea"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-demo"
  }
}
