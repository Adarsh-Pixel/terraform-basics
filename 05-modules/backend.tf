provider "aws" {}

terraform {
  backend "s3" {
    bucket = "b55-tf-state"
    key    = "tfmodules/terraform.tfstate"
    region = "us-east-1"
  }
}