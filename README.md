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

> argument: This comes up as a part of resource creation! This is to define properties to the resource you are creating.
----
> argument example: ami, security_group, key_name
---

> attribute: These are the properties of the resource which will only be available after the resource creation only
----
> attribute example: private_ip, vm_id, network_attribute
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

# precedence
---
    $ When compared to the values of the variables declared in terraform.tfvars, command line variables will have higher precendence
    $ -var / -var-file   >  terraform.auto.tfvars  > terraformtfvars > shell variables
---

### Shell Based Variables :

---
    These are the variables with least priority and this can be supplied by shell using export.
        $ export TF_VAR_varName=value  
    This is how we can supply the shell based variables
---

### What exactly happens when you run terraform plan ?

---
    When you run a terraform plan,  terraform is going to check the CURRENT STATE OF THE INFRASTRUCTURE and then it validates with what's there in the code that you're suppling against the terraform state file.
    If there are any changes ( how it comes to know ? Becuase of the above validation) , then terraform shows that to you during plan output.
    If you wan to want those changes, then you need to a `terraform apply` , when you do a terraform apply, your state will also be updated
    Eventually, your manual changes will be wiped off.
---

### Terraform has created some infrasturcure and then you manually went and updated the changes of the INFRA using console. Now if you Terraform Apply with the same old code , what will happen ???

---
    For Terraform, whatever is there in the CODE and as per that PLAN will be generated and for terraform PLAN is the source of truth, which means when you do a `terraform apply` , all your manual changes will be wiped off.

    99% of the times, a good setup will ensure you as a user won't be having write access on the console.
    Only the IAM Role, which we use to configure JENKINS will only have right access.
---

## what all needs to be created ??
    1) Network      (Done)
    2) Database     (MongoDB, MySQL, Redis, RabbitMQ)
    3) Backend / applications components


## For DB's, AWS offers PaS [Managed service for Databases ] and here is the advantage of it. 

!) Backups and restoration would be offered by the cloud provider.
2) Maintenance of the underlying infrastructure will be handled by the provider.
3) Storage and Maintenance will be handled by the provider.
4) DB Maintenance will go planned and will be handled by the provider and sometimes it incurs downtime. (only for major upgrades)
5) High availability is offered as per the need.

MongoDB     ----->  Document DB [Our Applications code: USER, CART, CATALOGUE are designed to operate with Mongo without username and password]
MySQL       ----->  RDS
Redis       ----->  Elastic Cache
RabbitMQ    ----->  Amazon MQ   [Our Application is not compatible with. Hence, we go with RabbitMQ on ec2 only]

We will create 5 repos: 
1) Terraform-Databases [This will be the root module]
2) tf-module-docdb     [ This will be the backend module for Document DB]
3) tf-module-mysql     [ this will be the backend module for MySQL]
4) tf-module-redis     [ this will be the backend module for redis]
5) tf-module-rabbitmq  [ this will be the backend module for RabbitMQ]

# How can we read the information from another statefile ?

In our case, terraform-databases, should have the information of the VPC which is created by the terraform-vpc!!!
How can one repository reads the information from another statefile. 

---
Always ensure on adding the needed values as an OUTPUT. So that, those values will be recorded in statefile in a format that will be accessible by other modules. 

All the databases, needs the subnet, vpc and other information from the network. Let's record the output.
So that the DB module can access it. 
---