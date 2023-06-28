terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.70.0"
    }
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

// Configure the Google Cloud provider
provider "google" {
  credentials = file(var.credentials)
  project     = var.gcp_project
  region      = var.region
}

provider "docker" {
  registry_auth {
    address = "us-central1-docker.pkg.dev"
    config_file = pathexpand("../capstone-docker-config.json")
  }
}

resource "google_artifact_registry_repository" "docker-repo" {
  format        = "DOCKER"
  location      = var.region
  project       = var.gcp_project
  repository_id = "capstone-products"
}

resource "docker_registry_image" "pr_image" {
  name          = docker_image.product_image.name
  keep_remotely = true
}

resource "docker_image" "product_image" {
    name = "${var.region}-docker.pkg.dev/${var.project_id}/capstone-products/products"
    build{
        context = "." // Directory containing Dockerfile and application code relative to the project root
    }
}

