## Data source to fetch the info of AMI 

data "aws_ami" "ami" {
  most_recent      = true
  name_regex       = "b55-ansible-lab-image"
  owners           = ["self"]
}

resource "aws_instance" "web" {
  count         = length(var.instances)
  ami           = data.aws_ami.ami.image_id
  instance_type = "t3.medium"

  tags = {
    Name        = "${var.instances[count.index]}"
  }
}

variable "instances" {
  default = ["catalogue", "user", "cart", "shipping"]
}

output "private_ip_address" {
  value = aws_instance.web.*.private_ip
}