resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  user_data = <<-EOF
              #!/bin/bash
              echo "ec2-user:20Inferyx!9" | chpasswd
              sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
              sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
              systemctl restart sshd
              EOF

  tags = {
    Name = "Terraform-EC2"
  }
}
