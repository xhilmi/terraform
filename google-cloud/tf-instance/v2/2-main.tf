provider "google" {
  project = "<PROJECT_ID>"
  region  = "us-west2"
  zone    = "us-west2-a"
}

locals {
  instance_names = ["a", "b", "c"]
}

resource "google_compute_instance" "k8s_worker_node" {
  count        = length(local.instance_names)
  name         = "k8s-worker-node-${element(local.instance_names, count.index)}"
  machine_type = "e2-small"
  zone         = "us-west2-a"

  boot_disk {
    initialize_params {
      image     = "ubuntu-os-cloud/ubuntu-2204-lts"
      size      = 20
      type      = "pd-balanced"
      labels = {
        node = "k8s_worker_node"
      }
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata_startup_script = "echo 'Hello, World!'"
}
