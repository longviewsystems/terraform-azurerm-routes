output "default_route_table_name" {
  description = "Returns the name of the created route table"
  value       = azurerm_route_table.default_route_table.name
}

output "default_route_table_object" {
  description = "Returns the full object of the created route table"
  value       = azurerm_route_table.default_route_table
}
output "default_route_id" {
  description = "Returns the ID of the created route table"
  value       = flatten(concat([for s in azurerm_route.default_routes : s.id]))
}


# custom
output "custom_route_table_name" {
  description = "Returns the name of the created route table"
  value       = azurerm_route_table.custom_route_table.name
}

output "custom_route_table_object" {
  description = "Returns the full object of the created route table"
  value       = azurerm_route_table.custom_route_table
}
output "custom_route_id" {
  description = "Returns the ID of the created route table"
  value       = flatten(concat([for s in azurerm_route.custom_routes : s.id]))
}