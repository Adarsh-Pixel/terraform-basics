resource "aws_instance" "web" {
    count = 0
  ami           = "ami-01f27c3753a7bf4fc"
  instance_type = "t3.medium"

  tags = {
    Name = "Terraform-Web-Instance"
  }
}