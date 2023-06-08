provider "google" {
  credentials = file("xthanos-terraform.json")
  project     = "xthanos" # Project A
  region      = "us-east1"
  alias	      = "xthanos"
}

provider "google" {
  credentials = file("xhilmi-terraform.json")
  project     = "xhilmi" # Project B
  region      = "us-east1"
  alias       = "xhilmi"
}
