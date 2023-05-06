# Terraform Google Cloud Platform on Linux
1. Install Terraform: https://github.com/xhilmi/terraform/blob/master/install_terraform.sh
2. Install GCP SDK: https://github.com/xhilmi/terraform/blob/master/google-cloud/install_sdk.sh
3. Login into GCP: https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/getting_started#configuring-the-provider
    - gcloud auth application-default login
    - gcloud auth login
    - gcloud projects list
    - gcloud config set project $PROJECT_ID
    - gcloud compute instances list 
4. Create Service Accounts GCP: https://github.com/xhilmi/terraform/blob/master/google-cloud/README.md#setting-iam-service-accounts
5. Running Terraform Command: https://github.com/xhilmi/terraform/blob/master/USABLE.md

# Setting IAM Service Accounts 
1. Create new service accounts : https://prnt.sc/iAg0dkC6QAfg
2. Service accounts detail : https://prnt.sc/IAo8wshSaN7l
3. Spesify role for user : https://prnt.sc/tNz4JAIFDCZb
4. Continue and done : https://prnt.sc/uqQxDVGi6zpF
5. Click spesify account : https://prnt.sc/5HrolxIRFXKL
6. Create JSON new keys : https://prnt.sc/F1gOYco6_V4K
7. Download and save keys into your master-vm
8. Create main.tf : https://github.com/xhilmi/terraform/blob/master/google-cloud/tf-example/main.tf
9. Create main.tfVars : https://github.com/xhilmi/terraform/blob/master/google-cloud/tf-example/main.tfvars

# Usefull Command gCloud CLI 
- gcloud init
- gcloud auth login
- gcloud auth application-default login
- gcloud projects list
- gcloud projects list --sort-by=projectId --limit=5
- gcloud config set project <PROJECT_ID>

- gcloud auth revoke
- gcloud storage ls
- gcloud storage buckets list
- gcloud services list

- gcloud compute instances list

- gcloud compute images list
- gcloud compute images list --filter="name~'ubuntu'"
- gcloud compute images list --filter="project~'ubuntu'"
- gcloud compute images list --filter="family~'ubuntu'"

- gcloud compute instances list

- gcloud compute machine-types list
- gcloud compute machine-types list --filter="name~'e2' zone~'asia-southeast2'"
- gcloud compute machine-types list --filter="name:(e2) zone:(asia-southeast2)"

- gcloud compute zones list
- gcloud compute zones list --filter="name~'asia-southeast'"
- gcloud compute zones list --filter="region~'asia-southeast'"
- gcloud compute zones list --filter="name~'asia-southeast' region~'asia-southeast'"
- for zone in "us-central1" "us-west1" "northamerica-northeast1" "northamerica-northeast2"; gcloud compute zones list --filter="name~$zone region~$zone"; end;
- for zone in "us-central1" "us-west1" "northamerica-northeast1" "northamerica-northeast2"; do gcloud compute zones list --filter="name~'$zone' region~'$zone'"; done;

# Sitemap repository
- [tf-example](https://github.com/xhilmi/terraform/tree/master/google-cloud/tf-example) = login and tested service accounts auth 
- [tf-instance](https://github.com/xhilmi/terraform/tree/master/google-cloud/tf-instance) = create bulk compute engine vm instance 
- [tf-subnetwork](https://github.com/xhilmi/terraform/tree/master/google-cloud/tf-subnetwork) = create network + subnetwork + secondary ip  
