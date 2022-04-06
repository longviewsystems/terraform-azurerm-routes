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
  source              = "../../" # testing root module
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  route_tables = {
    route_table_default = { # key value for route table
      route_table_name              = "default-route-table"
      disable_bgp_route_propagation = true
      RouteType                     = "default"
      route_entries = {
        default_route1 = { # key value for routes
          route_name             = "default"
          address_prefix         = "10.0.2.0/24"
          next_hop_type          = "VnetLocal"
          next_hop_in_ip_address = null
        }
        default_route2 = { # key value for routes
          route_name             = "AzureFireWall"
          address_prefix         = "0.0.0.0/0"
          next_hop_type          = "Internet"
          next_hop_in_ip_address = null
        }
      }
    }
    route_table_custom = {
      route_table_name              = "custom-route-table"
      disable_bgp_route_propagation = true
      RouteType                     = "custom"
      route_entries = {
        custom_route1 = {
          route_name             = "custom"
          address_prefix         = "10.0.0.16/28"
          next_hop_type          = "VirtualAppliance"
          next_hop_in_ip_address = "10.0.0.10"
        }
        custom_route2 = {
          route_name             = "AzureFireWall"
          address_prefix         = "0.0.0.0/0"
          next_hop_type          = "Internet"
          next_hop_in_ip_address = null
        }
      }
    }
  }
} 