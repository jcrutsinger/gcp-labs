terraform {

  backend "gcs" {

    bucket = "capstone-core-gke"

    prefix = "terraform/state/"

  }

}
