# Terraform Cloud Providers
- Amazon Web Services
- Google Cloud Platform

# Usable command
- terraform init
- terraform apply
- terraform apply -auto-approve
- terraform apply -var-file terraformVars.tfvars
- terraform destroy
- terraform destroy -auto-approve
- terraform destroy -target google_compute_subnetwork.dev_subnet_02
- terraform plan
- terraform state list
- terraform state show google_compute_network.development_network
- terraform validate

# Usefull command
  - git filter-branch -f --index-filter 'git rm --cached -r --ignore-unmatch .terraform/'
