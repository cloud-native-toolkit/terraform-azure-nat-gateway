variable "resource_group_name" {
  type        = string
  description = "The name of the Azure resource group where the VPC has been provisioned"
}

variable "region" {
  type        = string
  description = "The Azure location where the load balancer will be installed"
}
variable "nat_gw_name" {
  type        = string
  description = "The name of Azure NAT Gateway which will be created."
}
variable "public_ip_name" {
  type        = string
  description = "The name of public IP which will be created."
  default     = ""
}
variable "public_ip_prefix_name" {
  type        = string
  description = "The name of public IP prefix which will be created."
  default     = ""
}
variable "public_ip_allocation_method" {
  type        = string
  description = "Public IP address allocation method - Static or Dynamic"
  default     = "Static"
}
variable "public_ip_sku" {
  type        = string
  description = "The public IP SKU"
  default     = "Standard"
}
variable "public_ip_zones" {
  type        = list(string)
  description = "The public IP zones"
  default     = ["1"]
}
variable "public_ip_prefix_length" {
  type        = number
  description = "The public IP prefix"
  default     = 30
}
variable "nat_sku_name" {
  type        = string
  description = "The NAT SKU name"
  default     = "Standard"
}
variable "nat_idle_timeout" {
  type        = number
  description = "The NAT idle timeout"
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
  default     = ["1"]
}


