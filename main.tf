resource "azurerm_subnet" "subnet" {
  for_each                                       = var.subnets
  name                                           = "${each.value.name}${each.value.subnetRouteSet}"
  resource_group_name                            = var.resource_group_name
  virtual_network_name                           = var.vnetwork_name
  address_prefixes                               = each.value.subnet_address_prefix
  service_endpoints                              = lookup(each.value, "service_endpoints", [])
  enforce_private_link_endpoint_network_policies = lookup(each.value, "enforce_private_link_endpoint_network_policies", null)
}

#*****************************************************************
# Creates default route table & routes and assocaite custom subnets
#*****************************************************************
resource "azurerm_route_table" "default_route_table" {
  name                          = var.default_route_table_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  disable_bgp_route_propagation = var.default_disable_bgp_route_propagation
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

resource "azurerm_subnet_route_table_association" "default_route_table_association" {
  for_each = {
    for key, value in var.subnets :
    key => value
    if lookup(value, "subnetRouteSet", "default") == "default"
  }
  subnet_id      = azurerm_subnet.subnet[each.key].id
  route_table_id = azurerm_route_table.default_route_table.id
}

#*****************************************************************
# Creates Custom route table & routes and assocaite custom subnets
#*****************************************************************
resource "azurerm_route_table" "custom_route_table" {
  name                          = var.custom_route_table_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  disable_bgp_route_propagation = var.custom_disable_bgp_route_propagation
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

resource "azurerm_subnet_route_table_association" "custom_route_table_association" {
  for_each = {
    for key, value in var.subnets :
    key => value
    if lookup(value, "subnetRouteSet", "default") != "default"
  }
  subnet_id      = azurerm_subnet.subnet[each.key].id
  route_table_id = azurerm_route_table.custom_route_table.id
}