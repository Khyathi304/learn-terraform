variable "ami" {
  default = "ami-03265a0778a880afb"
}
variable "instance_type" {
  default = "t3.small"
}
variable "security_groups" {
  default = [ "sg-0e9bb0f3fd84f7811" ]
}
variable "zone_id" {
  default = "Z01685992MRA8PYOVXM0X"
}
variable "components" {
  default = {
    frontend = { name = "frontend-dev" }
    catalogue = { name = "catalogue-dev" }
    mongodb = { name = "mongodb-dev" }
    user = { name = "user-dev" }
    redis = { name = "redis-dev" }
    cart = { name = "cart-dev" }
    mysql = { name = "mysql-dev" }
    shipping = { name = "shipping-dev" }
    rabbitmq = { name = "rabbitmq-dev" }
    payment = { name = "payment-dev" }
    dispatch = { name = "dispatch-dev" }
  }
}

resource "aws_instance" "instance" {
  for_each = var.components
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_groups

  tags = {
    Name = lookup(each.value, "name", null)
  }
}

resource "aws_route53_record" "record" {
  for_each = var.components
  zone_id = var.zone_id
  name    = "{lookup(each.value, "name", null)}.kdevops304.online"
  type    = "A"
  ttl     = 30
  records = [lookup(lookup(aws_instance.instance, each.key, null ), "private_ip", null)]
}


output "instance" {
  value = aws_instance.instance
}

