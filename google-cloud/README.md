Youtube Video :
https://youtube.com/playlist?list=PL4SGTPmSY0qngs44Ssc0RHO9h4fmZ9JUb

# Terraform Google Cloud Platform on Linux
1. apt install Terraform on master-vm : https://github.com/hilmi-afifi/terraform/blob/master/install_terraform.sh
2. apt install SDK on master-vm : https://github.com/hilmi-afifi/terraform/blob/master/google-cloud/install_sdk.sh
3. create service accounts on GCP
4. running usable terraform command

# Setting IAM Service Accounts 
1. Create new service accounts : https://prnt.sc/iAg0dkC6QAfg
2. Service accounts detail : https://prnt.sc/IAo8wshSaN7l
3. Spesify role for user : https://prnt.sc/tNz4JAIFDCZb
4. Continue and done : https://prnt.sc/uqQxDVGi6zpF
5. Click spesify account : https://prnt.sc/5HrolxIRFXKL
6. Create JSON new keys : https://prnt.sc/F1gOYco6_V4K
7. Download and save keys into your master-vm
8. Create main.tf : https://github.com/hilmi-afifi/terraform/blob/master/google-cloud/tf-example/main.tf
9. Create main.tfVars : https://github.com/hilmi-afifi/terraform/blob/master/google-cloud/tf-example/main.tfvars
