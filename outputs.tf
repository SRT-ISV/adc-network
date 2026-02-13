output "vpc_id" {
  description = "VPC ID"
  value = module.network.vpc_id
}

output "vpc_selflink" {
  description = "VPC Self Link"
  value = module.network.vpc_self_link
}

output "subnet_ids" {
  description = "Subnet ID"
  value = module.network.subnet_ids
}

output "subnet_selflink" {
  description = "Subnet selflink"
  value = module.network.subnet_self_links
}