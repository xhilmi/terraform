variable google_credentials {
  description = "google_credentials"
  type        = string
}

variable machine_zone {
  description = "machine_zone"
  type        = list(object({
      us-central1                     = string
      us-west1                        = string
      northamerica-northeast1         = string
      northamerica-northeast2         = string
  }))
}

variable machine_type {
  description = "machine_type"
  type        = list(object({
      e2-small                      = string
      e2-medium                     = string
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
