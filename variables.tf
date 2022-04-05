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