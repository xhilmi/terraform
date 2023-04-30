# credentials = "../../../gcloud-auth.json" # /path/<filename>.json
# machine_zone = "us-west2-a"

credentials = [
    {   google                  : "../../../gcloud-auth.json", # /path/<filename>.json
        k8s-master-ssh-user     : "ansible-k8s-master",
        k8s-worker-ssh-user     : "ansible-k8s-worker",
        private-key-master      : "~/.ssh/ansible-k8s-master",
        private-key-worker      : "~/.ssh/ansible-k8s-worker",
    },
]

machine_zone = [
    {   us-west2                : "us-west2-a",
        asia-southeast2         : "asia-southeast2-a",
        australia-southeast2    : "australia-southeast2-a",
        europe-west2            : "europe-west2-a",
    },
]

startup_script = [
    {   master: "sudo ufw disable && sudo service ufw stop",
        worker: "sudo ufw disable && sudo service ufw stop",
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


network_interface = "default"

# v0
boot_disk = [
  { image: "ubuntu-os-cloud/ubuntu-2204-lts",
    size: 40,
    type: "pd-balanced",
    tags: "k8s_master_node"
    },
  { image: "ubuntu-os-cloud/ubuntu-2204-lts",
    size: 20,
    type: "pd-balanced",
    tags: "k8s_worker_node"
    },
]

# v1
# boot_disk = [
#  {image: "ubuntu-os-cloud/ubuntu-2204-lts", size: 40, type: "pd-balanced", tags: "k8s_master_node"},
#  {image: "ubuntu-os-cloud/ubuntu-2204-lts", size: 20, type: "pd-balanced", tags: "k8s_worker_node"},
#]