provider "google" {
  project = "project-1-359102"
  region  = "us-central1"
  zone    = "us-central1-a"
}

resource "google_compute_instance_template" "tp1" {
  name_prefix  = "instance-template-"
  machine_type = "f1-micro"
  tags         = ["http-server"]

  disk {
    source_image = "hello-world-family"
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network = var.vpc_name
    access_config {
      network_tier = "PREMIUM"
    }
  }

  metadata = {
    foo = "meta1"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "google_compute_instance_group_manager" "mig" {
  name        = var.mig_name
  description = "Terraform test instance group manager"
  base_instance_name = "tf-lab-test"

  version {
    instance_template = google_compute_instance_template.tp1.self_link
  }

  target_size  = 2

  named_port {
    name = "http"
    port = 80
  }
}
