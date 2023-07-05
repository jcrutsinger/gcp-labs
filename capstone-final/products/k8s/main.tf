terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.70.0"
    }
  }
}

// Configure the Google Cloud provider
provider "google" {
  credentials = file(var.credentials)
  project     = var.gcp_project
  region      = var.region
}

provider "kubernetes" {
    config_path = "../../core/gke/kubeconfig-${var.env_name}"
}

data "template_file" "products_template" {
    template = file("${path.module}/deployment.yml")
    vars = {
        image_tag = "latest"
    }
}

resource "kubernetes_manifest" "products_deployment" {
    manifest = yamldecode(data.template_file.products_template.rendered)
}

data "template_file" "service" {
    template = file("${path.module}/service.yml")
}

resource "kubernetes_manifest" "products_service" {
    manifest = yamldecode(data.template_file.service.rendered)
}
