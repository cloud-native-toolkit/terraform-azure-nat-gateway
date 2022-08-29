locals {
  subnet_cidr = cidrsubnets(var.vnet_cidr, 2)
}

module "subnets" {
  source = "github.com/cloud-native-toolkit/terraform-azure-subnets"

  resource_group_name = module.resource_group.name
  region              = module.resource_group.region
  vnet_name           = module.vnet.name
  ipv4_cidr_blocks    = ["${local.subnet_cidr[0]}"]
  acl_rules = []
}
