terraform {

  backend "gcs" {

    bucket = "tf_state_trigger"

    prefix = "terraform/state/"

  }

  required_providers {

    google = {

      source = "hashicorp/google"

    }
  }
}
