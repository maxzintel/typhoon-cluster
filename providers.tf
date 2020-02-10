provider "google" {
  version     = "3.4.0"
  project     = "spiderproject"
  region      = "us-east"
  credentials = file("~/.config/google-cloud/terraform.json")
}

provider "ct" {
  version = "0.4.0"
}
