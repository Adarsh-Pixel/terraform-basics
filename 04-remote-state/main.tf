resource "aws_instance" "web" {
  count         = var.howManyYouWant

  ami           = "ami-01f27c3753a7bf4fc"
  instance_type = "t3.medium"

  tags = {
    Name = "Terraform-Web-Instance-${count.index+1}"
  }
}