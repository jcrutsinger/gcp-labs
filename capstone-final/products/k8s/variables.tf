variable "project_id" {
  default = "project-41-390015"
}

variable "credentials" {
  default = "../../capstone-main.json"
}

variable "gcp_project" {
  default = "project-41-390015"
}

variable "cluster_name" {
  description = "The name for the GKE cluster"
  default     = "capstone-cluster"
}

variable "env_name" {
  description = "The environment for the GKE cluster"
  default     = "prod"
}

variable "region" {
  description = "The region to host the cluster in"
  default     = "us-central1"
}

variable "zone" {
  description = "The zone to host the cluster in"
  default     = "us-central1-a"
}