variable "project_id" {
  description = "The GCP project ID"
  type        = string
  default     = "easysaas-adc-demo"
}

variable "region" {
  description = "The default region for resources"
  type        = string
  default     = "us-central1"
}

variable "vpc_name" {
  description = "Name of the custom VPC"
  type        = string
  default     = "hardend-vpc"
}

variable "firewall_source_string" {
  type        = string
  description = "Pass multiple ranges like '0.0.0.0/0, 1.1.1.1/32'"
  default     = "0.0.0.0/0"
}
