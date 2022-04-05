output "resource_group_name" {
  description = "The name of the resource group in which resources are created"
  value       = azurerm_resource_group.resource_group.name
}

output "resource_group_id" {
  description = "The id of the resource group in which resources are created"
  value       = azurerm_resource_group.resource_group.id
}

output "resource_group_location" {
  description = "The location of the resource group in which resources are created"
  value       = azurerm_resource_group.resource_group.location
}

output "virtual_network_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.vnet.name
}

output "virtual_network_id" {
  description = "The id of the virtual network"
  value       = azurerm_virtual_network.vnet.id
}

output "virtual_network_address_space" {
  description = "List of address spaces that are used the virtual network."
  value       = azurerm_virtual_network.vnet.address_space
}

output "subnet_ids" {
  description = "List of IDs of subnets"
  value       = flatten(concat([for s in azurerm_subnet.subnet : s.id]))
}