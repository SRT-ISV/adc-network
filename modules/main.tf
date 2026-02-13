
# The VPC will now automatically use easysaas-adc-demo
resource "google_compute_network" "custom_vpc" {
  name                    = var.vpc_name
  project                 = var.project_id
  routing_mode            = "REGIONAL"
  auto_create_subnetworks = false
}

# Subnets will use the project_id from the provider 
# and the region specified in the map
resource "google_compute_subnetwork" "subnets" {
  for_each = var.subnet_config
  name          = each.key
  ip_cidr_range = each.value.ip_range
  region        = each.value.region # Overrides provider default if different
  network       = google_compute_network.custom_vpc.id
  project     = var.project_id
}



# Firewall with String-to-List Conversion
resource "google_compute_firewall" "deny_all_ingress" {
  name    = "deny-all-ingress"
  network = google_compute_network.custom_vpc.name
  project     = var.project_id
  direction = "INGRESS"
  priority  = 1000

  deny {
    protocol = "all"
  }

  # THIS IS THE CONVERSION: String -> List
  source_ranges = [for s in split(",", var.firewall_source_string) : trimspace(s)]
}