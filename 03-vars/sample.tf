# Plain Variable
variable "fruit_name" {
  default = "apple"
}

output "fruit_name" {
  value = var.fruit_name
}

# List Variable
variable "fruits" {
  default = [
    "apple" ,
    "banana"
  ]
    //  default = ["apple", "banana"]
}

# Map Variable, plain
variable "fruit_stock" {
  default = {
    apple = 100
    banana = 200
  }
}

# Map variable, Map of maps
variable "fruit_with_stock_price" {
  default = {
    apple = {
      stock = 100
      price = 3
    }
    banana = {
      stock = 300
      price = 1
    }
  }
}

# Access a list Variable List index start from 0

output "fruit_first" {
  value = var.fruits[0]
}
output "fruit_second" {
  value = var.fruits[1]
}

# Access a map variable

output "fruit_stock_apple" {
  value = var.fruit_stock["apple"]
}