terraform {
 backend "gcs" {
   bucket  = "capstone-orders-docker"
   prefix  = "terraform/state"
 }
}
