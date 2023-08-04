variable "components" {
  default = [ "frontend", "mongodb" ]
}

resource "aws_instance" "instance" {
  count = length(var.components)
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-0e9bb0f3fd84f7811" ]

  tags = {
    Name = ""
    }
  }
