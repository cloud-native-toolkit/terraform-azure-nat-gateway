module "azure-nat_gateway" {
  source               = "./module"
  
  resource_group_name  = module.resource_group.name
  region               = module.resource_group.region
  nat_gw_name          = "${local.name_prefix}-nat"
  subnet_id            = module.subnets.id
}
