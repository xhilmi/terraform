# variable google_credentials {
#   description = "google_credentials"
#   type        = string
# }

variable credentials {
  description = "credentials"
  type        = list(object({
      google                = string
      k8s-master-ssh-user   = string
      private-key-master    = string
      k8s-worker-ssh-user   = string
      private-key-worker    = string
  }))
}


variable machine_zone {
  description = "machine_zone"
  type        = list(object({
      us-west2                = string
      asia-southeast2         = string
      australia-southeast2    = string
      europe-west2            = string
  }))
}

variable network_interface {
  description = "network_interface"
  type        = string
}

variable startup_script {
  description = "startup_script"
  type        = list(object({
      master    = string
      worker    = string
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
