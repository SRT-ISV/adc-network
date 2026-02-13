module "network" {
source = "./modules"    
project_id = var.project_id
region = var.region
vpc_name = var.vpc_name
firewall_source_string = var.firewall_source_string

}