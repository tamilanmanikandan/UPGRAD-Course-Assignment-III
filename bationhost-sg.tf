data "http" "icanhazip" {
   url = "http://ipv4.icanhazip.com"
}
resource "aws_security_group" "ingress-all-test" {
name = "bastion-host-sg"
vpc_id = module.vpc.vpc_id
ingress {
#    cidr_blocks = [
#       "${chomp(data.http.icanhazip.body)}/32"
#     ]
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
// Terraform removes the default rule
  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}
