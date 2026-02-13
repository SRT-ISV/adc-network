# Output the unique VPC ID
output "vpc_id" {
  description = "The ID of the created VPC"
  value       = google_compute_network.custom_vpc.id
}

# Output the VPC Self Link (often needed for other GCP resources)
output "vpc_self_link" {
  description = "The URI of the created VPC"
  value       = google_compute_network.custom_vpc.self_link
}

# Output a map of Subnet Names and their corresponding IDs
output "subnet_ids" {
  description = "Map of subnet names to their resource IDs"
  value = {
    for name, subnet in google_compute_subnetwork.subnets : name => subnet.id
  }
}

# Output a map of Subnet Names and their Self Links
output "subnet_self_links" {
  description = "Map of subnet names to their URIs"
  value = {
    for name, subnet in google_compute_subnetwork.subnets : name => subnet.self_link
  }
}