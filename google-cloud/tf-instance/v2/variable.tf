variable machine_zone {
  description = "machine_zone"
  type        = string
}

variable network_interface {
  description = "network_interface"
  type        = string
}

variable startup_script {
  description = "startup_script"
  type        = string
}

# create multiple instance using spesify name  
variable multiple_worker_node {
  description = "multiple_worker_node"
  type        = list(object({
    name = string
  }))
}

variable boot_disk {
  description = "boot_disk"
  type        = list(object({
    image     = string
    size      = string
    type      = string
  })) 
}
