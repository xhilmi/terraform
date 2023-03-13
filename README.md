Youtube Video :
https://youtube.com/playlist?list=PL4SGTPmSY0qngs44Ssc0RHO9h4fmZ9JUb

# Terraform Google Cloud Platform on Linux
1. apt install terraform on master-vm
2. apt install Google Cloud SDK on master-vm
3. create service accounts on GCP
4. running usable terraform command

# Terraform Usable Command
- terraform init
- terraform apply
- terraform apply -auto-approve
- terraform apply -var-file name.tfvars
- terraform destroy
- terraform destroy -auto-approve
- terraform destroy -target google_compute_subnetwork.dev_subnet_01
- terraform plan
- terraform state list
- terraform state show google_compute_network.development_network
- terraform validate



