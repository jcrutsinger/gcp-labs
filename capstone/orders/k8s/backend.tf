terraform {
 backend "gcs" {
   bucket  = "capstone-orders-gke"
   prefix  = "terraform/state"
 }
}
