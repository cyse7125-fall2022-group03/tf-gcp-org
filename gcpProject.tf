terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}
provider "google" {
 
  region  = "us-east1"
  zone    = "us-east1-c"
}

resource "google_project" "my_project" {
  name       = "csye71251"
  project_id = "csye71251"
  org_id     = "370221421887"
}
