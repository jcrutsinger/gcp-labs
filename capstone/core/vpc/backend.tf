terraform {

  backend "gcs" {

    bucket = "capstone-core-vpc"

    prefix = "terraform/state/"

  }

}
