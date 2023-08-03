variable "fruits" {
  default = [ "apple", "banana"]
}

output "fruits" {
#  value = var.fruits[2]
  value = element(var.fruits, 2)
}

variable "fruits_stock" {
  default = {
    apple = 100
  }
}

output "fruit" {
  #  value = var.fruits[2]
  value = var.fruits_stock["banana"]
}