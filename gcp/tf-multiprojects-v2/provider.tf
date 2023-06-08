# Provider configuration for project A using service account JSON file
provider "google" {
  credentials = file("xthanos-terraform.json")
  project     = "xthanos" # Project A
  region      = "us-east1"
  alias       = "xthanos"
}


# Provider configuration for project B using email IAM
locals {
  terraform_service_account = "terraform@xthanos.iam.gserviceaccount.com"
}
provider "google" {
 project     = "xhilmi" # Project B
 region      = "us-east1"
 alias       = "xhilmi"
 scopes = [
   "https://www.googleapis.com/auth/cloud-platform",
   "https://www.googleapis.com/auth/userinfo.email",
 ]
}


