location           = "westus2"
vnet_address_space = ["10.1.0.0/16"]
dns_servers        = []
subnets = {
  Subnet_1 = {
    name                  = "subnet1"
    subnet_address_prefix = ["10.1.0.0/24"]
    service_endpoints     = ["Microsoft.Sql"]
  }
  Subnet_2 = {
    name                  = "subnet2"
    subnet_address_prefix = ["10.1.2.0/24"]
    service_endpoints     = ["Microsoft.Sql"]
  }
}