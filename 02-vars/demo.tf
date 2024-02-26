#declaring an variable

variable "sample" {
    default = "Hello World"
}

#printing an output
output "op" {
    value = var.sample
}

#whenever you want to print the variable in the group of words, you need to use the bash syntax
output "ops" {
    value = "My first msg is ${var.sample}"
}

# A variable can be accessed directly by caling  it as var.VariableName
# In terraform there is no concept of single quotes. 

variable "number" {
    default = 100
}

output "op_number" {
    value = var.number
}

# declaring a list variable
variable sample_list {
    default = [
        "DevOps" ,
        55,
        "Manoj",
        "0730AMIST"
    ]
}

output "print_list" {
    value = "Welcome to ${var.sample_list[0]} training and the batch timinings are ${var.sample_list[3]} and the batch number is ${var.sample_list[1]}"
}

# Declaring a Map variable

variable sample_map {
    default = {
        batch     = "b55"
        Mode      = "Online"
        Training  = "DevOpswithAWS"
    }
}

# Printing a Map variable
output "sample_map_op" {
    value = "${var.sample_map["Training"]} has great scope of opportunities and this is complete ${var.sample_map["Mode"]} training"
}

### Declaring an empty variable and passing the value in the *.tfvars file ######

variable "city" {}

output "city_name" {
    value = "Name of the city is ${var.city}"
}

variable "state" {}

output "state_name" {
    value = var.state
}

variable "country" {}

output "country_name"{
    value = "Name of our country is ${var.country}"
}

variable "states" {}

output "states_count" {
    value = "Total number of states in India is ${var.states}"
}

variable "fav_cloud" {}

output "fav_cloud_op" {
    value = "My favourite cloud is ${var.fav_cloud}"
}