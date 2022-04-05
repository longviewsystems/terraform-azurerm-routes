# default route table
default_route_table_name       = "route-table-default"
default_route_address_prefixes = ["10.0.2.0/24", "0.0.0.0/0"]
default_route_nexthop_types    = ["VnetLocal", "Internet"]
default_route_names            = ["default", "AzureFireWall"]
default_next_hop_in_ip_address = null

# custom route table
custom_route_table_name       = "route-table-custom"
custom_route_address_prefixes = ["10.0.3.0/24"]
custom_route_nexthop_types    = ["VnetLocal"]
custom_route_names            = ["custom"]
custom_next_hop_in_ip_address = null