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
    stock = 10
  }
}

output "fruit" {
  #  value = var.fruits[2]
  value = try(var.fruits_stock["banana"], 0)
}

output "fruit_Stock" {
#  value = lookup(var.fruits_stock["apple"], "stock", 0)
  value = try(var.fruits_stock["apple"].price , 2)
}