# terraform-basics

This repository contains all the basics that are needs to learn and start with terraform.

>> What is terraform

---
Terraform is an open-source infrastructure as code (IaC) tool developed by HashiCorp. 

It allows users to define and provision infrastructure resources in a declarative configuration language. With Terraform, you can describe the desired state of your infrastructure in code using domain specific language called HashiCorp Configuration Language (HCL).
---

>>> Terraform only recognizes the files that end with *.tf or *.tfvars

* All the infra files ends with *.tf
* All the variable files ends with *.tfvars and terraform.tfvars is the default terraform variables file which will be recornized by terraform by default.
* Any variables file *.tfvars apart from terraform.tfvars has to be explicitily mentioned while running terraform commands.

> How to supply variables file are a part of terraform sample ?

---
$terraform plan -var-file=dev.tfvars
---