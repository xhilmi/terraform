#############################################################################
                 #GCP ProjectA                                          
#############################################################################

## Create VPC/Subnet in Project xthanos
resource "google_compute_network" "vpc1" {
  name                    = "my-custom-network-1"
  provider                = google.xthanos
  auto_create_subnetworks = "false"
}
resource "google_compute_subnetwork" "my-custom-subnet1" {
  name          = "my-custom-subnet-1"
  ip_cidr_range = "10.255.196.0/24"
  network       = google_compute_network.vpc1.name
  region        = "us-east1"
  provider      = google.xthanos
}

## Create VM 
resource "google_compute_instance" "my_vm" {
  project      = "xthanos"
  zone         = "us-east1-c"
  name         = "demo-1"
  machine_type = "e2-micro"
  provider     = google.xthanos
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network    = "my-custom-network-1"
    subnetwork = google_compute_subnetwork.my-custom-subnet1.name # Replace with a reference or self link to your subnet, in quotes
  }
}


#############################################################################
                            #GCP ProjectB                                                          #
#############################################################################

## Create VPC/Subnet in Project xhilmi
resource "google_compute_network" "vpc2" {
  name                    = "my-custom-network-2"
  provider                = google.xhilmi
  auto_create_subnetworks = "false"
}
resource "google_compute_subnetwork" "my-custom-subnet2" {
  name          = "my-custom-subnet-2"
  ip_cidr_range = "10.255.184.0/24"
  network       = google_compute_network.vpc2.name
  region        = "us-east1"
  provider      = google.xhilmi
}

## Create VM 
resource "google_compute_instance" "my_vm2" {
  project      = "xhilmi"
  zone         = "us-east1-c"
  name         = "demo-2"
  machine_type = "e2-micro"
  provider     = google.xhilmi
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network    = "my-custom-network-2"
    subnetwork = google_compute_subnetwork.my-custom-subnet2.name # Replace with a reference or self link to your subnet, in quotes
  }
}
