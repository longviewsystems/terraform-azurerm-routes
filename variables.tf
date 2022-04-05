variable "resource_group_name" {
  type        = string
  description = "The name of the Resource group"
  default     = "rg-demo-westeurope-01"
}

variable "location" {
  type        = string
  description = "The Location where RG is created"
  default     = "westeurope"
}

variable "tags" {
  type        = map(any)
  description = "Resource tags"
  default = {
    environment = "test"
    managed_by  = "terratest"
  }
}

# # vnet 
variable "vnetwork_name" {
  description = "Name of your Azure Virtual Network"
  type        = string
  default     = "vnet-azure-westeurope-001"
}

variable "vnet_address_space" {
  description = "The address space to be used for the Azure virtual network."
  type        = list(any)
  default     = ["10.1.0.0/16"]
}
variable "dns_servers" {
  description = "List of dns servers to use for virtual network"
  type        = list(any)
  default     = []
}

variable "subnets" {
  description = "For each subnet, create an object that contain fields"
  type        = map(any)
  default = {
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
      subnetRouteSet        = "custom"

    }
  }
}

# default route variables
variable "default_route_table_name" {
  type        = string
  description = "The name of the RouteTable being created."
}

variable "default_disable_bgp_route_propagation" {
  type        = string
  description = "Option to disable BGP route propagation on this Route Table."
  default     = "true"
}

variable "default_route_names" {
  type        = list(string)
  description = "(Required) default route table object to be created."
  default     = []
}

variable "default_route_address_prefixes" {
  type        = list(string)
  description = "The Route Address prefixes."
  default     = []
}

variable "default_route_nexthop_types" {
  type        = list(string)
  description = "The type of Azure hop the packet should be sent to."
  default     = []
}

variable "default_next_hop_in_dynamic_private_ip" {
  description = "(Optional) dynamically passing private ip address which is an output of another tf resource or module, e.g. azure firewall"
  type        = string
  default     = null
}

variable "default_next_hop_in_ip_address" {
  description = "Contains the IP address packets should be forwarded to"
  type        = string
  default     = null
}


# custom route variables
variable "custom_route_names" {
  type        = list(string)
  description = "(Required) custom route table object to be created."
  default     = []
}

variable "custom_route_table_name" {
  type        = string
  description = "The name of the RouteTable being created."
}

variable "custom_disable_bgp_route_propagation" {
  type        = string
  description = "Option to disable BGP route propagation on this Route Table."
  default     = "true"
}

variable "custom_route_address_prefixes" {
  type        = list(string)
  description = "The Route Address prefixes."
  default     = []
}

variable "custom_route_nexthop_types" {
  type        = list(string)
  description = "The type of Azure hop the packet should be sent to."
  default     = []
}

variable "custom_next_hop_in_dynamic_private_ip" {
  description = "(Optional) dynamically passing private ip address which is an output of another tf resource or module, e.g. azure firewall"
  type        = string
  default     = null
}

variable "custom_next_hop_in_ip_address" {
  description = "Contains the IP address packets should be forwarded to"
  type        = string
  default     = null
}