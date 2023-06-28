terraform {
 backend "gcs" {
   bucket  = "capstone-products-docker"
   prefix  = "terraform/state"
 }
}
