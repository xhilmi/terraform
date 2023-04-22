google_credentials = "/path/to/file/project-id.json"

machine_zone = "us-west2-a"
startup_script = "sudo ufw disable && sudo service ufw stop"
network_interface = "default"

boot_disk = [
  {image: "ubuntu-os-cloud/ubuntu-2204-lts", size: 40, type: "pd-balanced", tags: "k8s_master_node"},
  {image: "ubuntu-os-cloud/ubuntu-2204-lts", size: 20, type: "pd-balanced", tags: "k8s_worker_node"},
]
