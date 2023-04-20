# Terraform Google Cloud Platform on Linux
1. apt install Terraform on master-vm: https://github.com/hilmi-afifi/terraform/blob/master/install_terraform.sh
2. apt install SDK on master-vm: https://github.com/hilmi-afifi/terraform/blob/master/google-cloud/install_sdk.sh
3. configure and login into GCP: https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/getting_started#configuring-the-provider
    - gcloud auth application-default login
    - gcloud auth login
    - gcloud projects list
    - gcloud config set project $PROJECT_ID
    - gcloud compute instances list 
4. create service accounts on GCP: https://github.com/hilmi-afifi/terraform/blob/master/google-cloud/SERVICES.md
5. running usable terraform command: https://github.com/hilmi-afifi/terraform/blob/master/USABLE.md


# Sitemap repository
- [tf-example](https://github.com/hilmi-afifi/terraform/tree/master/google-cloud/tf-example) = login and tested service accounts auth 
- [tf-instance](https://github.com/hilmi-afifi/terraform/tree/master/google-cloud/tf-instance) = create bulk compute engine vm instance 
- [tf-subnetwork](https://github.com/hilmi-afifi/terraform/tree/master/google-cloud/tf-subnetwork) = create network + subnetwork + secondary ip  
