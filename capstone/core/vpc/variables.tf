variable "region" {
    default = "us-central1"
}

variable "gcp_project" {
    default = "project-41-390015"
}

variable "credentials" {
    default = "../capstone-main.json"
}

variable "project_name" {
    default = "capstone"
}

variable "frontend-subnet" {
    default = "10.0.0.0/24"
}

variable "backend-subnet" {
    default = "10.0.1.0/24"
}

variable "scopes_default_web" {
  default = [
    "https://www.googleapis.com/auth/cloud.useraccounts.readonly",
    "https://www.googleapis.com/auth/devstorage.read_only",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring.write",
    "https://www.googleapis.com/auth/compute.readonly",
  ]
}

variable "zone" {
  default = "us-central1-a"
}
