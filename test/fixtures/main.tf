module "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.1.1"
  suffix  = ["networking"]
  prefix  = ["lic"]

  unique-include-numbers = false
  unique-length          = 4
}


resource "azurerm_resource_group" "resource_group" {
  name     = module.naming.resource_group.name_unique
  location = var.location
  tags     = var.tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = module.naming.virtual_network.name_unique
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group.name
  dns_servers         = var.dns_servers
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "subnet" {
  for_each                                       = var.subnets
  name                                           = each.value.name
  resource_group_name                            = azurerm_resource_group.resource_group.name
  virtual_network_name                           = azurerm_virtual_network.vnet.name
  address_prefixes                               = each.value.subnet_address_prefix
  service_endpoints                              = lookup(each.value, "service_endpoints", [])
  enforce_private_link_endpoint_network_policies = lookup(each.value, "enforce_private_link_endpoint_network_policies", null)
}

# create default & custom Route table and routes
module "routes" {
  source                         = "../../" # testing root module
  custom_next_hop_in_ip_address  = null
  custom_route_address_prefixes  = ["10.0.3.0/24", "0.0.0.0/0"]
  custom_route_names             = ["custom1", "custom2"]
  custom_route_nexthop_types     = ["VnetLocal", "Internet"]
  custom_route_table_name        = "route-table-custom"
  default_next_hop_in_ip_address = null
  default_route_address_prefixes = ["10.0.2.0/24", "0.0.0.0/0"]
  default_route_names            = ["default1", "default2"]
  default_route_nexthop_types    = ["VnetLocal", "Internet"]
  default_route_table_name       = "route-table-default"
  location                       = azurerm_resource_group.resource_group.location
  resource_group_name            = azurerm_resource_group.resource_group.name
} 