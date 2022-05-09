module "azure-nat_gateway" {
  source               = "./module"
  resource_group_name  = module.resource_group.name
  region               = var.region
  nat_gw_name          = "nat_gw_name"
}
