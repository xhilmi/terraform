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

variable boot_disk {
  description = "boot_disk"
  type        = list(object({
    image     = string
    size      = string
    type      = string
  })) 
}
