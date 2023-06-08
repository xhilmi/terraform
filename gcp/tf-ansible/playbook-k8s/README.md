# Generate SSH Key Pair
- Run the following command to generate elliptic curve ssh key pair
`ssh-keygen -t ed25519 -f ~/.ssh/ansbile_ed25519 -C ansible`
- Optionally, you can generate RSA key pair
`ssh-keygen -t rsa -f ~/.ssh/ansible-k8s-master -C ansible-k8s-master -b 2048`
`ssh-keygen -t rsa -f ~/.ssh/ansible-k8s-worker -C ansible-k8s-worker -b 2048`

# Add SSH Key to GCP Project
- Go to compute engine section
- Click Metadata
- Select SSH KEYS tab and click ADD SSH KEY
- Upload public ansible-k8s-master.pub key
  - cat ~/.ssh/ansible-k8s-master.pub
- Upload public ansible-k8s-worker.pub key
  - cat ~/.ssh/ansible-k8s-worker.pub

# Create Ansible Playbook for Nginx Installation
- Create roles/nginx/tasks/main.yaml task
- Create nginx.yaml playbook
- Create Ansible config ansible.cfg to skip host key verification