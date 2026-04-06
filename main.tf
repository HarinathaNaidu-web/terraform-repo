provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "demo" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-demo"
  }
}
