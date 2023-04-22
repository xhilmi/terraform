# define provider
provider "google" {
  project     = "<PROJECT_ID>"
  region      = "asia-southeast2"
  credentials = var.google_credentials
}

##### K8S MASTER NODE #####
# create instance master node
resource "google_compute_instance" "k8s_master_node" {
  name         = "k8s-master-node"
  machine_type = "e2-medium"
  zone         = var.machine_zone
  boot_disk {
    initialize_params {
      image   = var.boot_disk[0].image
      size    = var.boot_disk[0].size
      type    = var.boot_disk[0].type
    }
  }
  network_interface {
    network   = var.network_interface
    access_config {
      // Ephemeral public IP
    }
  }
  metadata_startup_script = var.startup_script
}

##### K8S WORKER NODE #####
# create instance worker node
resource "google_compute_instance" "k8s_worker_node" {
  # create multiple instance using number 
  count        = 2
  name         = "k8s-worker-${count.index + 1}"
  machine_type  = "e2-small"
  zone          = var.machine_zone
  boot_disk {
    initialize_params {
      image   = var.boot_disk[1].image
      size    = var.boot_disk[1].size
      type    = var.boot_disk[1].type
    }
  }
  network_interface {
    network   = var.network_interface
    access_config {
      // Ephemeral public IP
    }
  }
  metadata_startup_script = var.startup_script
}
