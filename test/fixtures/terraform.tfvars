location           = "westus2"
vnet_address_space = ["10.1.0.0/16"]
dns_servers        = []
subnets = {
  Subnet_1 = {
    name                  = "subnet1"
    subnet_address_prefix = ["10.1.0.0/24"]
    service_endpoints     = ["Microsoft.Sql"]
    subnetRouteSet        = "default"
  }
  Subnet_2 = {
    name                  = "subnet2"
    subnet_address_prefix = ["10.1.2.0/24"]
    service_endpoints     = ["Microsoft.Sql"]
    subnetRouteSet        = "default"
  }
  Subnet_3 = {
    name                  = "subnet3"
    subnet_address_prefix = ["10.1.3.0/24"]
    service_endpoints     = ["Microsoft.Sql"]
    subnetRouteSet        = "default"
  }
  Subnet_4 = {
    name                  = "subnet4"
    subnet_address_prefix = ["10.1.4.0/24"]
    service_endpoints     = ["Microsoft.Sql"]
    subnetRouteSet        = "custom"

  }
  Subnet_5 = {
    name                  = "subnet5"
    subnet_address_prefix = ["10.1.5.0/24"]
    service_endpoints     = ["Microsoft.Sql"]
    subnetRouteSet        = "custom"

  }
}
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