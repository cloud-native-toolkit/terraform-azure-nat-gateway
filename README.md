# Azure NAT Gateway

## Module Overview

Module creates an Azure NAT Gateway with public IP and attaches to a provided subnet. Includes the following resources:
- azurerm_public_ip
- azurerm_public_ip_prefix
- azurerm_nat_gateway
- azurerm_nat_gateway_public_ip_association
- azurerm_nat_gateway_public_ip_prefix_association
- azurerm_nat_gateway_association

### Prerequisities

### Software dependencies

- terraform >= 1.2.6

### Terraform providers

- Azure provider >= 3.0.0

### Module dependencies

This modules makes use of the output from other modules:
- Azure Resource Group - github.com/cloud-native-toolkit/terraform-azure-resource-group
- Azure VNet - github.com/cloud-native-toolkit/terraform-azure-vnet
- Azure Subnets - github.com/cloud-native-toolkit/terraform-azure-subnets

## Example Usage

```hcl-terraform
module "resource_group" {
  source = "github.com/cloud-native-toolkit/terraform-azure-resource-group"

  resource_group_name = "mytest-rg"
  region              = var.region
}

module "vnet" {
  source = "github.com/cloud-native-toolkit/terraform-azure-vnet"

  name_prefix         = "mytest"
  resource_group_name = module.resource_group.name
  region              = module.resource_group.region
  address_prefixes    = ["10.0.0.0/18"]
}

module "subnets" {
  source = "github.com/cloud-native-toolkit/terraform-azure-subnets"

  resource_group_name = module.resource_group.name
  region              = module.resource_group.region
  vnet_name           = module.vnet.name
  ipv4_cidr_blocks    = ["10.0.0.0/24"]
  acl_rules           = []
}

module "azure-nat_gateway" {
  source               = "github.com/cloud-native-toolkit/terraform-azure-nat-gateway"
  
  nat_gw_name          = "mytest-nat"  
  resource_group_name  = module.resource_group.name
  region               = module.resource_group.region
  subnet_id            = module.subnets.id
}
```

## Variables

### Inputs

This module has the following input variables:
| Variable | Mandatory / Optional | Default Value | Description |
| -------------------------------- | --------------| ------------------ | ----------------------------------------------------------------------------- |
| resource_group_name | Mandatory |  | The resource group to which to associate the NAT gateway  |
| region | Mandatory |  | The Azure location into which to deploy the NAT gateway |
| nat_gw_name | Mandatory |  | The name to give the NAT gateway |
| subnet_id | Mandatory |  | The id of the subnet in the vnet to which to associate the NAT gateway |
| existing_public_ip_name | Optional | "" | Name of an existing public IP to which to associate the NAT gateway (if not provided will create one) |
| public_ip_name  | Optional | "" | Overwrite name to apply to the created public ip (will append \"-pip\" to the nat_gw_name if not provided) |
| public_ip_prefix_name  | Optional | "" | Overwrite name to apply to the created public ip prefix (will append \"-ipPrefix\" to the nat_gw_name if not provided) |
| public_ip_allocation_method | Optional | Static | Public IP address allocation method |
| public_ip_sku | Optional | Standard | Public IP SKU |
| public_ip_zones | Optional | \[ 1 \] | List of Azure availability zones to which the public IP should be located |
| public_ip_prefix_length | Optional | 30 | The public IP prefix length |
| nat_sku_name | Optional | Standard | The NAT SKU name |
| nat_idle_timeout | Optional | 10 | The idle timeout for the NAT gateway in minutes |
| nat_zones | Optional | \[ 1 \] | List of Azure availability zones to which the NAT gateway should be located |
| tags | Optional | \[ \] | Mapping of tags to assign to the NAT gateway |

### Outputs

The module outputs the following values:
| Output | Description |
| -------------------------------- | -------------------------------------------------------------------------- |
| id | The Id of the deployed NAT gateway |
| ip_address | The address of the created or supplied public IP |
| public_ip_id | The Azure Id of the created or supplied public IP |
| fqdn | The FQDN of the A DNS record associated with the public IP |