variable "security_groups" {
  default = [ "sg-0e9bb0f3fd84f7811" ]
}
variable "zone_id" {
  default = "Z01685992MRA8PYOVXM0X"
}

variable "component" {
  default = {
    frontend = {
      name = "frontend"
      instance_type = "t3.micro"
    }
    cart = {
      name = "cart"
      instance_type = "t3.micro"
    }
  }
}