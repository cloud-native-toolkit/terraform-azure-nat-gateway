# Starter kit for a Terraform module

This is a Starter kit to help with the creation of Terraform modules. The basic structure of a Terraform module is fairly
simple and consists of the following basic values:

- README.md - provides a description of the module
- main.tf - defiens the logic for the module
- variables.tf (optional) - defines the input variables for the module
- outputs.tf (optional) - defines the values that are output from the module

Beyond those files, any other content can be added and organized however you see fit. For example, you can add a `scripts/` directory
that contains shell scripts executed by a `local-exec` `null_resource` in the terraform module. The contents will depend on what your
module does and how it does it.

## Instructions for creating a new module

1. Update the title and description in the README to match the module you are creating
2. Fill out the remaining sections in the README template as appropriate
3. Implement your logic in the in the main.tf, variables.tf, and outputs.tf
4. Use releases/tags to manage release versions of your module

## Module overview

### Description

Description of module

**Note:** This module follows the Terraform conventions regarding how provider configuration is defined within the Terraform template and passed into the module - https://www.terraform.io/docs/language/modules/develop/providers.html. The default provider configuration flows through to the module. If different configuration is required for a module, it can be explicitly passed in the `providers` block of the module - https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly.

### Software dependencies

The module depends on the following software components:

#### Command-line tools

- terraform >= v0.15

#### Terraform providers

- Azure provider >= 2.9.0

### Module dependencies

- terraform-azure-resource-group

### Example usage

```hcl-terraform
module "argocd" {
  source = "github.com/cloud-native-toolkit/terraform-tools-argocd.git"

  cluster_config_file = module.dev_cluster.config_file_path
  cluster_type        = module.dev_cluster.type
  app_namespace       = module.dev_cluster_namespaces.tools_namespace_name
  ingress_subdomain   = module.dev_cluster.ingress_hostname
  olm_namespace       = module.dev_software_olm.olm_namespace
  operator_namespace  = module.dev_software_olm.target_namespace
  name                = "argocd"
}
```

## Input Variables

This module has the following input variables:
| Variable | Mandatory / Optional | Default Value | Description |
| -------------------------------- | --------------| ------------------ | ----------------------------------------------------------------------------- |
| resource_group_name | Mandatory | "" | Resource group into which to deploy NAT gateway  |
| region | Mandatory | "" | Azure region into which to deploy NAT gateway |
| nat_gw_name | Mandatory | "" | Name to assign to the NAT gateway |
| existing_public_ip_name | Optional | "" | Existing public IP to be attached to. Leave as default to create new public IP.  |
| public_ip_name | Optional | "" | Name to assign to a created public IP |
| public_ip_prefix_name | Optional | "" | Prefix to assign to a created public IP |
| public_ip_allocation_method | Optional | Static | Public IP address allocation method - Static or Dynamic |
| public_ip_sku | Optional | Standard | The Azure SKU type for the public IP |
| public_ip_zones | Optional | 1 | List of Azure availability zones for the public IP address |
| public_ip_prefix_length | Optional | 30 | The public IP prefix length |
| nat_sku_name | Optional | Standard | The Azure SKU for the NAT gateway |
| nat_idle_timeout | Optional | 10 | The idle timeout in minutes for the NAT gateway |
| nat_zones | Optional | 1 | List of Azure availability zones for the NAT gateway |
| tags | Optional | "" | A mapping of tags to assign the created resources |

## Output Variables

This module has the following outputs:

| Output |  Description |
| -------------------------------- | ----------------------------------------------------------------------------- |
| id | ID of the NAT gateway |