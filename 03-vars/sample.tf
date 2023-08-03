# Plain Variable
variable "fruit_name" {
  default = "berry"
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

output "fruit_stock_with_price_banana" {
  value = var.fruit_with_stock_price["banana"].price
}

# Variable data types
variable "fruit_details" {
  default = {
    apple = {
      stock = 100 #number
      type = "washington" #string
      for_sale = true #boolean
    }
  }
}

#variable in a combination of any other strings then it needs to be within ${}

output "fruit_name_1" {
  value = "Fruit_name = ${var.fruit_name}"
}

output "fruit_details_apple" {
  value = "Apple stock = ${var.fruit_details["apple"].stock}, Apple type = ${var.fruit_details["apple"].type}, Apple sale status = ${var.fruit_details["apple"].for_sale}"
}