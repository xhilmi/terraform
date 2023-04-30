# this is terraform basic example file

# set provider google cloud on jakarta
provider "google" {
    project = "project-id"
    region = "asia-southeast2"
    credentials = var.google_credentials
}

# define variable for google credentials
variable "google_credentials" {
  description = "google credentials"
}
