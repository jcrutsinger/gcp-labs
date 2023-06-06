terraform {

  backend "gcs" {

    bucket = "trigger_state_tf"

    prefix = "terraform/state/"

  }

  required_providers {

    google = {

      source = "hashicorp/google"

    }
  }
}
