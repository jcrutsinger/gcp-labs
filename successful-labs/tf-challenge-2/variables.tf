variable "vpc_name" {
  description = "VPC Network"
  type        = string
  default     = "default"
}

variable "mig_name" {
  type        = string
  description = "Managed instance group name. When variable is empty, name will be derived from var.hostname."
  default     = "mig-lab"
}