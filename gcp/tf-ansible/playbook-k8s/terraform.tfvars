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

network_interface = "default"

boot_disk = [
    {   image: "ubuntu-os-cloud/ubuntu-2204-lts",
        size: 40,
        type: "pd-balanced",
        tags: "k8s_master_node"
    },
    {   image: "ubuntu-os-cloud/ubuntu-2204-lts",
        size: 20,
        type: "pd-balanced",
        tags: "k8s_worker_node"
    },
]