# variable "access_key" {
#         description = "Access key to AWS console"
# }
# variable "secret_key" {
#         description = "Secret key to AWS console"
# }

variable "instance_name" {
        description = "Name of the instance to be created"
        default = "k8s-master-node"
}

variable "instance_type" {
        default = "t3a.medium"
}

# https://ap-southeast-1.console.aws.amazon.com/vpc/
variable "subnet_id" {
        description = "The VPC subnet the instance(s) will be created in"
        default = "subnet-03ee95d02c5569bfd"
}

# https://cloud-images.ubuntu.com/locator/ec2/
variable "ami_id" {
        description = "The AMI to use"
        default = "ami-0a72af05d27b49ccb"
}

variable "number_of_instances" {
        description = "number of instances to be created"
        default = 2
}

# variable "ami_key_pair_name" {
#         default = "tomcat"
# }