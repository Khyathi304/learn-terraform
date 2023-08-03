variable "fruits" {
  default = [ "apple", "banana"]
}

output "frits" {
  value = var.fruits[2]
}