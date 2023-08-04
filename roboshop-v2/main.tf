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
    frontend = {}
    catalogue = {}
    mongodb = {}
    user = {}
    redis = {}
    cart = {}
    mysql = {}
    shipping = {}
    rabbitmq = {}
    payment = {}
    dispatch = {}
  }
}

resource "aws_instance" "instance" {
  for_each = var.components
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_groups

  tags = {
    Name = lookup(each.key, null )
  }
}

#resource "aws_route53_record" "record" {
#  for_each = var.zone_id
#  zone_id = var.zone_id
#  name    = "frontend-dev.kdevops304.online"
#  type    = "A"
#  ttl     = 30
#  records = [lookup(aws_instance.instance, each.key[""] )]
#}

#output "instance" {
#  value = aws_instance.instance
#}

