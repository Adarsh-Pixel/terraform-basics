# Creates EC2
resource "aws_instance" "Moapp" {
  ami                     = "ami-01f27c3753a7bf4fc"
  instance_type           = "t3.medium"
  vpc_security_group_ids  = [var.sg]
  tags = {
    Name = "Module-Instance"
  }
}

variable "sg" {}    # Declare the empty variable of the value you wish to pass and use it.