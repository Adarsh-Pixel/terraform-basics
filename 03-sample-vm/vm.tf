resource "aws_instance" "app" {
  ami           = "ami-01f27c3753a7bf4fc"
  instance_type = "t3.medium"

  tags = {
    Name = "Terraform-Instance"
  }
}