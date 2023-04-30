google_credentials = "../../../<GOOGLE_AUTH>.json"

machine_zone = "us-west2-a"
startup_script = "sudo ufw disable && sudo service ufw stop"
network_interface = "default"

# create multiple instance using spesify name 
multiple_worker_node = [
  {name: "a",},
  {name: "b",},
  {name: "c",},
]

boot_disk = [
  {image: "ubuntu-os-cloud/ubuntu-2204-lts", size: 40, type: "pd-balanced", tags: "k8s_master_node"},
  {image: "ubuntu-os-cloud/ubuntu-2204-lts", size: 20, type: "pd-balanced", tags: "k8s_worker_node"},
]
