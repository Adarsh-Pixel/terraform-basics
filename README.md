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
    $ terraform plan -var-file=dev.tfvars
---

> How to supply variables from the command line ? use -var city=delhi

---
    $ terraform apply -var-file=dev.tfvars -var states=28
---

### Attribute vs Argument in terraform

argument: This comes up as a part of resource creation! This is to define properties to the resource you are creating.
----
argument example: ami, security_group, key_name
---

attribute: These are the properties of the resource which will only be available after the resource creation only
----
attribute example: private_ip, vm_id, network_attribute
----


>>> You cannot create either an attribute nor an argument. You just need to stick to the provider documentation. 

### Can we write terraform code in multiple files of a folder?

---
Yes! As long as your code is in the files that ends with *.tf, terraform takes care of everything.

When you do a terraform plan, it will load all of them in Alphabetical order. But compiles as per the logic. (It will take care of it.)
----


### Common Terraform commands

---
    $ terraform init
    $ terraform plan
    $ terraform apply
---

### if you want to supply any value of the variable from the command line
---
    $ terraform plan -var VARNAME=value 
    $ terraform apply -auto-approve -var VARNAME=value 
---

### if you want to supply any value of the variable from another file apart from terraform.tfvars, you need to explicitly pass the variable file name to be used.
---
    $ terraform plan -var-file=dev.tfvars
    $ terraform apply -auto-approve -var-file=dev.tfvars
---