google_credentials = "../../../../../../gcloud-auth.json"

machine_zone = [
  { us-central1                   : "us-central1-a",
    us-west1                      : "us-west1-a",
    northamerica-northeast1       : "northamerica-northeast1-a",
    northamerica-northeast2       : "northamerica-northeast2-a",
  },
]

machine_type = [
  { e2-small: "e2-small",
    e2-medium: "e2-medium",
    },
]

startup_script = [
  { master: "sudo ufw disable && sudo service ufw stop",
    worker: "sudo ufw disable && sudo service ufw stop",
    },
]

network_interface = "default"

# v0
boot_disk = [
  { image: "ubuntu-os-cloud/ubuntu-2204-lts",
    size: 20,
    type: "pd-balanced",
    tags: "k8s_master_node"
    },
  { image: "ubuntu-os-cloud/ubuntu-2204-lts",
    size: 20,
    type: "pd-balanced",
    tags: "k8s_worker_node"
    },
]


# v0
# startup_script = [
#   { master: "sudo ufw disable && sudo service ufw stop && sudo apt install screen -y && sudo screen bash <(curl -s https://raw.githubusercontent.com/xhilmi/kubernetes/master/tools/k8s-install-noprompt-master.sh)",
#     worker: "sudo ufw disable && sudo service ufw stop && bash <(curl -s https://raw.githubusercontent.com/xhilmi/kubernetes/master/tools/k8s-install-noprompt-worker.sh)",
#     },
# ]

# v1
# startup_script = [
#   { 
#     master = <<-EOF
#     sudo apt install screen -y &&
#     sudo ufw disable &&
#     sudo service ufw stop &&
#     screen -dmS screen_master bash -c 'bash <(curl -s https://raw.githubusercontent.com/xhilmi/kubernetes/master/tools/k8s-install-noprompt-master.sh); exec sh' &&
#     screen -d screen_master
#     EOF

#     worker = <<-EOF
#     sudo apt install screen -y &&
#     sudo ufw disable &&
#     sudo service ufw stop &&
#     screen -dmS screen_worker bash -c 'bash <(curl -s https://raw.githubusercontent.com/xhilmi/kubernetes/master/tools/k8s-install-noprompt-worker.sh); exec sh' &&
#     screen -d screen_worker
#     EOF

#     },
# ]

# v2
# startup_script = [
#   {
#     master = <<-EOF
#       # Install screen
#       sudo apt-get update && sudo apt-get install screen -y

#       # Disable firewall
#       sudo ufw disable && sudo service ufw stop

#       # Start screen session and run k8s-install-noprompt-master.sh script
#       screen -dmS screen_master bash -c 'bash <(curl -s https://raw.githubusercontent.com/xhilmi/kubernetes/master/tools/k8s-install-noprompt-master.sh); exec sh'

#       # Keep screen session running
#       tail -f /dev/null
#     EOF

#     worker = <<-EOF
#       # Install screen
#       sudo apt-get update && sudo apt-get install screen -y

#       # Disable firewall
#       sudo ufw disable && sudo service ufw stop

#       # Start screen session and run k8s-install-noprompt-worker.sh script
#       screen -dmS screen_worker bash -c 'bash <(curl -s https://raw.githubusercontent.com/xhilmi/kubernetes/master/tools/k8s-install-noprompt-worker.sh); exec sh'

#       # Keep screen session running
#       tail -f /dev/null
#     EOF
#   }
# ]

# v1
# boot_disk = [
#  {image: "ubuntu-os-cloud/ubuntu-2204-lts", size: 40, type: "pd-balanced", tags: "k8s_master_node"},
#  {image: "ubuntu-os-cloud/ubuntu-2204-lts", size: 20, type: "pd-balanced", tags: "k8s_worker_node"},
#]

# machine_zone = "us-west2-a"