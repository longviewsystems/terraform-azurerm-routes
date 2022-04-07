route_tables = {
  route_table_default = { # key value for route table
    route_table_name              = "default"
    disable_bgp_route_propagation = true
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
    route_table_name              = "custom"
    disable_bgp_route_propagation = true
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