# Creates EC2
resource "aws_instance" "app" {
  ami                     = "ami-01f27c3753a7bf4fc"
  instance_type           = "t3.medium"
  vpc_security_group_ids  = [aws_security_group.allow_ssh.id]
  tags = {
    Name = "Terraform-Instance"
  }
}