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