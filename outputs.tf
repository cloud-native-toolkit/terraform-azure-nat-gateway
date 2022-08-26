output "id" {
  description = "The ID of the NAT Gateway."
  value       = azurerm_nat_gateway.nat_gateway.id
  depends_on  = [azurerm_nat_gateway.nat_gateway]
}

output "ip_address" {
  description = "The address of the public IP created or supplied"
  value = data.azurerm_public_ip.public_ip.ip_address
}

output "public_ip_id" {
  description = "The Azure Id of the public IP"
  value = data.azurerm_public_ip.public_ip.id
}

output "fqdn" {
  description = "The FQDN of the A DNS record associated with the public IP"
  value = data.azurerm_public_ip.public_ip.fqdn
}