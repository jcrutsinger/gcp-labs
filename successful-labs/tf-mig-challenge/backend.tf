terraform {

  backend "gcs" {

    bucket = "tf_state_tfmig"

    prefix = "terraform/state/"

  }

  required_providers {

    google = {

      source = "hashicorp/google"

    }
  }
}
