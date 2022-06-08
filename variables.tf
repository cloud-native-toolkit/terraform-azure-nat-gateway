variable "resource_group_name" {
  type        = string
  description = "The name of the Azure resource group where the NAT gateway has been provisioned"
}

variable "region" {
  type        = string
  description = "The Azure location where the NAT gateway will be installed"
}
variable "nat_gw_name" {
  type        = string
  description = "The name of Azure NAT Gateway which will be created"
}

variable "existing_public_ip_name" {
  type        = string
  description = "The name of existing Public IP."
  default     = ""
}

variable "public_ip_name" {
  type        = string
  description = "A Public IP Address id which should be associated with the NAT Gateway resource."
  default     = ""
}
variable "public_ip_prefix_name" {
  type        = string
  description = "The name of public IP prefix which should be associated with the NAT Gateway resource."
  default     = ""
}
variable "public_ip_allocation_method" {
  type        = string
  description = "Public IP address allocation method - Static or Dynamic"
  default     = "Static"
}
variable "public_ip_sku" {
  type        = string
  description = "The SKU which should be used. At this time the only supported value is Standard. Defaults to Standard."
  default     = "Standard"
}
variable "public_ip_zones" {
  type        = list(string)
  description = "Specifies a list of Availability Zones in which this NAT Gateway should be located."
  default     = ["1"]
}
variable "public_ip_prefix_length" {
  type        = number
  description = "The public IP prefix length"
  default     = 30
}
variable "nat_sku_name" {
  type        = string
  description = "The NAT SKU name"
  default     = "Standard"
}
variable "nat_idle_timeout" {
  type        = number
  description = "The idle timeout which should be used in minutes."
  default     = 10
}
variable "nat_zones" {
  type        = list(string)
  description = "Specifies a list of Availability Zones in which this NAT Gateway should be located. Changing this forces a new NAT Gateway to be created"
  default     = ["1"]
}
variable "tags" {
  type        = list(string)
  description = "A mapping of tags to assign to the resource. Changing this forces a new resource to be created."
  default     = []
}


