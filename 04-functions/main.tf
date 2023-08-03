variable "fruits" {
  default = [ "apple", "banana"]
}

output "frits" {
#  value = var.fruits[2]
  value = element(var.fruits,[2])
}