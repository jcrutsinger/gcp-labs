terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}


// Configure the Google Cloud provider
provider "google" {
 credentials = file(var.credentials)
 project     = var.gcp_project
 region      = var.region
}

// Create VPC
resource "google_compute_network" "vpc" {
 name                    = "${var.project_name}-vpc"
 auto_create_subnetworks = false
}

// Create Frontend Subnet
resource "google_compute_subnetwork" "frontend" {
 name          = "frontend-subnet" 
 ip_cidr_range = var.frontend-subnet
 network       = "${var.project_name}-vpc"
 depends_on    = [google_compute_network.vpc]
 region        = var.region
}

// Create Backend Subnet
resource "google_compute_subnetwork" "backend" {
 name          = "backend-subnet" 
 ip_cidr_range = var.backend-subnet
 network       = "${var.project_name}-vpc"
 depends_on    = [google_compute_network.vpc]
 region        = var.region
}

// VPC firewall configuration
resource "google_compute_firewall" "firewall" {
  name    = "${var.project_name}-firewall"
  network = google_compute_network.vpc.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-9000"]
  }

  source_tags = ["web"]

  source_ranges = ["0.0.0.0/0"]
}
