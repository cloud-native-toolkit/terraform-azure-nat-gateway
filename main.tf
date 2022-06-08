provider "azurerm" {
  features {
  }
}
locals {
  name_public_ip        = "${var.nat_gw_name}-ip"
  name_public_ip_prefix = "${var.nat_gw_name}-ipPrefix"
}
resource "azurerm_public_ip" "public_ip" {
  count               = var.existing_public_ip_name == "" ? 1 : 0
  name                = var.public_ip_name == "" ? local.name_public_ip : var.public_ip_name
  location            = var.region
  resource_group_name = var.resource_group_name
  allocation_method   = var.public_ip_allocation_method
  sku                 = var.public_ip_sku
  zones               = var.public_ip_zones
}

data "azurerm_public_ip" "public_ip" {
  count               = var.existing_public_ip_name == "" ? 0 : 1
  name                = var.existing_public_ip_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_public_ip_prefix" "public_ip_prefix" {
  name                = var.public_ip_prefix_name == "" ? local.name_public_ip_prefix : var.public_ip_prefix_name
  location            = var.region
  resource_group_name = var.resource_group_name
  prefix_length       = var.public_ip_prefix_length
  zones               = var.public_ip_zones
}

resource "azurerm_nat_gateway" "nat_gateway" {
  name                    = var.nat_gw_name
  location                = var.region
  resource_group_name     = var.resource_group_name
  sku_name                = var.nat_sku_name
  idle_timeout_in_minutes = var.nat_idle_timeout
  zones                   = var.nat_zones
}
resource "azurerm_nat_gateway_public_ip_association" "nat_gateway_public_ip_association" {
  nat_gateway_id       = azurerm_nat_gateway.nat_gateway.id
  public_ip_address_id = var.existing_public_ip_name == "" ? azurerm_public_ip.public_ip[0].id : data.azurerm_public_ip.public_ip[0].id
}

resource "azurerm_nat_gateway_public_ip_prefix_association" "nat_gateway_public_ip_prefix_association" {
  nat_gateway_id      = azurerm_nat_gateway.nat_gateway.id
  public_ip_prefix_id = azurerm_public_ip_prefix.public_ip_prefix.id
}
