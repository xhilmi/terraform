# set provider google cloud on id jakarta
provider "google" {
    project = "<PROJECT_ID>"
    region = "asia-southeast2"
    credentials = var.google_credentials
}

variable google_credentials {
  description = "google_credentials"
  type        = string
}

# create 5 instance directly and skip if exist
resource "google_compute_instance" "instance" {
  count        = 5
  name         = "my-instance-${count.index + 1}"
  machine_type = "n1-standard-1"
  zone         = "asia-southeast2-a"
  
  # specify image os
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }
  
  # specify network vpc by default
  network_interface {
    network = "default"
    access_config {
    }
  }
}
