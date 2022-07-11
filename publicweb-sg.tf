resource "aws_security_group" "ingress-all-sg" {
name = "public-web-sg"
vpc_id = module.vpc.vpc_id
ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
from_port = 80
    to_port = 80
    protocol = "tcp"
  }
  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
from_port = 8081
    to_port = 8081
    protocol = "tcp"
  }
  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
from_port = 22
    to_port = 22
    protocol = "tcp"
  }
// Terraform removes the default rule
  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}