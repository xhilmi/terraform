# define provider
provider "google" {
  project     = "xthanos" # <PROJECT_ID>
}

##### K8S MASTER NODE #####
# create instance master node
resource "google_compute_instance" "k8s_master_node" {
  name         = "k8s-master-node"
  machine_type = "e2-medium"
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
  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'"]
    connection {
      type        = "ssh"
      user        = var.credentials[0].k8s-master-ssh-user
      private_key = file(var.credentials[0].private-key-master)
      host        = self.network_interface.0.access_config.0.nat_ip
    }
  }
  provisioner "local-exec" {
    command = "ansible-playbook -i ${self.network_interface.0.access_config.0.nat_ip}, --private-key ${var.credentials[0].private-key-master} k8s-master.yaml"
  }
}

##### K8S WORKER NODE #####
# create instance worker node
resource "google_compute_instance" "k8s_worker_node_a" {
  # create multiple instance using number 
  count        = 2
  name         = "k8s-worker-a-${count.index + 1}"
  machine_type  = "e2-small"
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
  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'"]
    connection {
      type        = "ssh"
      user        = var.credentials[0].k8s-worker-ssh-user
      private_key = file(var.credentials[0].private-key-worker)
      host        = self.network_interface.0.access_config.0.nat_ip
    }
  }
  provisioner "local-exec" {
    command = "ansible-playbook -i ${self.network_interface.0.access_config.0.nat_ip}, --private-key ${var.credentials[0].private-key-worker} k8s-worker.yaml"
  }
  metadata_startup_script = var.startup_script[0].worker
}

# ##### K8S WORKER NODE #####
# # create instance worker node
# resource "google_compute_instance" "k8s_worker_node_b" {
#   # create multiple instance using number 
#   count        = 2
#   name         = "k8s-worker-b-${count.index + 1}"
#   machine_type  = "e2-small"
#   zone          = var.machine_zone[0].northamerica-northeast1
#   boot_disk {
#     initialize_params {
#       image   = var.boot_disk[1].image
#       size    = var.boot_disk[1].size
#       type    = var.boot_disk[1].type
#     }
#   }
#   network_interface {
#     network   = var.network_interface
#     access_config {
#       // Ephemeral public IP
#     }
#   }
#   provisioner "remote-exec" {
#     inline = ["echo 'Wait until SSH is ready'"]
#     connection {
#       type        = "ssh"
#       user        = var.credentials[0].k8s-worker-ssh-user
#       private_key = file(var.credentials[0].private-key-worker)
#       host        = self.network_interface.0.access_config.0.nat_ip
#     }
#   }
#   provisioner "local-exec" {
#     command = "ansible-playbook -i ${self.network_interface.0.access_config.0.nat_ip}, --private-key ${var.credentials[0].private-key-worker} k8s-worker.yaml"
#   }
#   metadata_startup_script = var.startup_script[0].worker
# }

# ##### K8S WORKER NODE #####
# # create instance worker node
# resource "google_compute_instance" "k8s_worker_node_c" {
#   # create multiple instance using number 
#   count        = 2
#   name         = "k8s-worker-c-${count.index + 1}"
#   machine_type  = "e2-small"
#   zone          = var.machine_zone[0].northamerica-northeast2
#   boot_disk {
#     initialize_params {
#       image   = var.boot_disk[1].image
#       size    = var.boot_disk[1].size
#       type    = var.boot_disk[1].type
#     }
#   }
#   network_interface {
#     network   = var.network_interface
#     access_config {
#       // Ephemeral public IP
#     }
#   }
#   provisioner "remote-exec" {
#     inline = ["echo 'Wait until SSH is ready'"]
#     connection {
#       type        = "ssh"
#       user        = var.credentials[0].k8s-worker-ssh-user
#       private_key = file(var.credentials[0].private-key-worker)
#       host        = self.network_interface.0.access_config.0.nat_ip
#     }
#   }
#   provisioner "local-exec" {
#     command = "ansible-playbook -i ${self.network_interface.0.access_config.0.nat_ip}, --private-key ${var.credentials[0].private-key-worker} k8s-worker.yaml"
#   }
#   metadata_startup_script = var.startup_script[0].worker
# }