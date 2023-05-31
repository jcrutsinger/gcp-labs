terraform {
  backend "local" {
    path = "/workspaces/gcp-labs/terraform-challenge/learn-terraform-gcp/terraform.tfstate"
  }
}
