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
    # key_name = "${var.ami_key_pair_name}"
} 