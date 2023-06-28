# define provider
provider "google" {
  project     = "project" # <PROJECT_ID>
  # region      = "asia-southeast2"
  credentials = var.google_credentials
}

##### K8S MASTER NODE #####
# create instance master node
resource "google_compute_instance" "k8s_master_node" {
  name         = "k8s-master-node"
  machine_type = var.machine_type[0].e2-medium
  zone         = var.machine_zone[0].us-central1
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
  count        = 1
  name         = "k8s-worker-a-${count.index + 1}"
  machine_type  = var.machine_type[0].e2-medium
  zone          = var.machine_zone[0].us-west1
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
#create instance worker node
resource "google_compute_instance" "k8s_worker_node_b" {
  # create multiple instance using number 
  count        = 1
  name         = "k8s-worker-b-${count.index + 1}"
  machine_type  = var.machine_type[0].e2-medium
  zone          = var.machine_zone[0].northamerica-northeast1
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

# #### K8S WORKER NODE #####
# create instance worker node
resource "google_compute_instance" "k8s_worker_node_c" {
  # create multiple instance using number 
  count        = 1
  name         = "k8s-worker-c-${count.index + 1}"
  machine_type  = var.machine_type[0].e2-medium
  zone          = var.machine_zone[0].northamerica-northeast2
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
