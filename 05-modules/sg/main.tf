# Creates security group
resource "aws_security_group" "allows_ssh" {
  name                      = "allows_ssh"
  description               = "Allows SSH inbound traffic"

  ingress {
    description              = "SSH from public Network"
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
    Name                     = "allow_public_ssh"
  }
}

# Step 1: Declare the info that you wish to share as OUTPUT
output "sgid" {
    value = aws_security_group.allows_ssh.id
}