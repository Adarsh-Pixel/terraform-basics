#declaring an variable

variable "sample" {
    default = "Hello World"
}

#printing an output
output "op" {
    value = var.sample
}