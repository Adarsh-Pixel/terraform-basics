resource "aws_instance" "app" {
  ami                     = "ami-01f27c3753a7bf4fc"
  instance_type           = "t3.medium"
  vpc_security_group_ids  = [aws_security_group.allow_ssh.id]
  tags = {
    Name = "Terraform-Instance"
  }
}

output "private_ip_address" {
  value                    = aws_instance.app.private_ip
}

# Creates security group
resource "aws_security_group" "allow_ssh" {
  name                      = "allow_ssh"
  description               = "Allow SSH inbound traffic"

  ingress {
    description              = "SSH from Internet"
    from_port                = 22
    to_port                  = 22
    protocol                 = "tcp"
    cidr_blocks              = ["0.0.0.0/0"]
  }

  egress {
    from_port                = 0
    to_port                  = 0
    protocol                 = "-1"
    cidr_blocks              = ["0.0.0.0/0"]
  }

  tags = {
    Name                     = "allow_ssh"
  }
}