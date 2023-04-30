# define provider
provider "google" {
  project     = "<PROJECT_ID>" # <PROJECT_ID>
  region      = "asia-southeast2"
  credentials = var.google_credentials
}

##### K8S MASTER NODE #####
# create instance master node
resource "google_compute_instance" "k8s_master_node" {
  name         = "k8s-master-node"
  machine_type = "e2-medium"
  zone         = var.machine_zone[0].us-west2
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
  metadata_startup_script = var.startup_script[0].master
}

##### K8S WORKER NODE #####
# create instance worker node
resource "google_compute_instance" "k8s_worker_node_a" {
  # create multiple instance using number 
  count        = 2
  name         = "k8s-worker-a-${count.index + 1}"
  machine_type  = "e2-small"
  zone          = var.machine_zone[0].asia-southeast2
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
  metadata_startup_script = var.startup_script[0].worker
}

##### K8S WORKER NODE #####
# create instance worker node
resource "google_compute_instance" "k8s_worker_node_b" {
  # create multiple instance using number 
  count        = 2
  name         = "k8s-worker-b-${count.index + 1}"
  machine_type  = "e2-small"
  zone          = var.machine_zone[0].australia-southeast2
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
  metadata_startup_script = var.startup_script[0].worker
}

##### K8S WORKER NODE #####
# create instance worker node
resource "google_compute_instance" "k8s_worker_node_c" {
  # create multiple instance using number 
  count        = 2
  name         = "k8s-worker-c-${count.index + 1}"
  machine_type  = "e2-small"
  zone          = var.machine_zone[0].europe-west2
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
  metadata_startup_script = var.startup_script[0].worker
}