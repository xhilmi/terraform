# set provider google cloud on id jakarta
provider "google" {
    project = "<PROJECT_ID>"
    region = "asia-southeast2"
    credentials = var.google_credentials
}

# define variable for google credentials
variable "google_credentials" {
  description = "google credentials"
}

# define variable for subnet ip cidr range
variable "subnet_ip_cidr_range" {
  description = "ip cidr range for all subnet"
  type = list(object({
    name = string
    range = string
  }))
}

# define variable for secondary ip cidr range
variable "secondary_ip_cidr_range" {
  description = "ip cidr range for all secondary"
  type = list(object({
    name = string
    range = string
  }))
}

# create network
resource "google_compute_network" "development_network" {
    name = "development-network"
    auto_create_subnetworks = false
}

# create subnetwork 1 with secondary ip
resource "google_compute_subnetwork" "dev_subnet_01" {
    name = var.subnet_ip_cidr_range[0].name
    ip_cidr_range = var.subnet_ip_cidr_range[0].range
    network = google_compute_network.development_network.id
    region = "asia-southeast2"
    secondary_ip_range {
        range_name = var.secondary_ip_cidr_range[0].name
        ip_cidr_range = var.secondary_ip_cidr_range[0].range
    }
}

# create subnetwork 2 with secondary ip
resource "google_compute_subnetwork" "dev_subnet_02" {
    name = var.subnet_ip_cidr_range[1].name
    ip_cidr_range = var.subnet_ip_cidr_range[1].range
    network = google_compute_network.development_network.id
    region = "asia-southeast2"
    secondary_ip_range {
        range_name = var.secondary_ip_cidr_range[1].name
        ip_cidr_range = var.secondary_ip_cidr_range[1].range
    }
}
