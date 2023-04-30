# # Configure the AWS Provider
# provider "aws" {
#   # version = "~> 4.0"
#   region = "us-southeast-1"
#   # shared_credentials_files = ["~/.aws/credentials"]
#   profile = "hilmi"
# }

provider "aws" {
    # access_key = "${var.access_key}"
    # secret_key = "${var.secret_key}"
    shared_credentials_files = ["/home/thanos/.aws/credentials"]
    region = "ap-southeast-1"
    profile = "default"
}

resource "aws_instance" "ec2_instance" {
    ami = "${var.ami_id}"
    count = "${var.number_of_instances}"
    subnet_id = "${var.subnet_id}"
    instance_type = "${var.instance_type}"
    vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
    # key_name = "${var.ami_key_pair_name}"
} 


resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow All Ingress and Egress Traffic"
#   vpc_id      = aws_vpc.main.id

  ingress {
    description      = "Allow All Ingress Traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    description      = "Allow All Egress Traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_all"
  }
}

# resource "aws_default_security_group" "default" {
#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }