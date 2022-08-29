variable "resource_group_name" {
  type        = string
  description = "Resource group to be created."
}

variable "name_prefix" {
  type        = string
  description = "Prefix name that should be used for the cluster and services. If not provided then resource_group_name will be used"
  default     = ""
}

variable "vnet_cidr" {
  type = string
  description = "CIDR for VNet"
  default = "10.0.0.0/18"
}

variable "region" {
  type        = string
  description = "Region/location to deploy into."
}

variable "subscription_id" {
  type        = string
  description = "Subscription Id"
}

variable "client_id" {
  type        = string
  description = "Client Id"
}

variable "client_secret" {
  type        = string
  description = "Client secret"
}

variable "tenant_id" {
  type        = string
  description = "Tenant Id"
}