#*****************************************************************
# Creates default route table & routes and assocaite custom subnets
#*****************************************************************
resource "azurerm_route_table" "default_route_table" {
  name                          = var.default_route_table_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  disable_bgp_route_propagation = var.default_disable_bgp_route_propagation
  tags                          = var.tags
}

resource "azurerm_route" "default_routes" {
  count                  = length(var.default_route_names)
  name                   = var.default_route_names[count.index]
  resource_group_name    = var.resource_group_name
  route_table_name       = azurerm_route_table.default_route_table.name
  address_prefix         = var.default_route_address_prefixes[count.index]
  next_hop_type          = var.default_route_nexthop_types[count.index]
  next_hop_in_ip_address = var.default_route_nexthop_types == "VirtualAppliance" ? (var.default_next_hop_in_dynamic_private_ip != null && var.default_next_hop_in_dynamic_private_ip != "null" && var.default_next_hop_in_dynamic_private_ip != "" ? var.default_next_hop_in_dynamic_private_ip : var.default_next_hop_in_ip_address) : null
}


#*****************************************************************
# Creates Custom route table & routes and assocaite custom subnets
#*****************************************************************
resource "azurerm_route_table" "custom_route_table" {
  name                          = var.custom_route_table_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  disable_bgp_route_propagation = var.custom_disable_bgp_route_propagation
  tags                          = var.tags
}

resource "azurerm_route" "custom_routes" {
  count                  = length(var.custom_route_names)
  name                   = var.custom_route_names[count.index]
  resource_group_name    = var.resource_group_name
  route_table_name       = azurerm_route_table.custom_route_table.name
  address_prefix         = var.custom_route_address_prefixes[count.index]
  next_hop_type          = var.custom_route_nexthop_types[count.index]
  next_hop_in_ip_address = var.custom_route_nexthop_types == "VirtualAppliance" ? (var.custom_next_hop_in_dynamic_private_ip != null && var.custom_next_hop_in_dynamic_private_ip != "null" && var.custom_next_hop_in_dynamic_private_ip != "" ? var.custom_next_hop_in_dynamic_private_ip : var.custom_next_hop_in_ip_address) : null
}