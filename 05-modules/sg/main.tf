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

# Step 1: Declare the info that you wish to share as OUTPUT
output "sg" {
    value = aws_security_group.allow_ssh.id
}