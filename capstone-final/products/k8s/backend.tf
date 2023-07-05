terraform {
 backend "gcs" {
   bucket  = "capstone-products-gke"
   prefix  = "terraform/state"
 }
}
