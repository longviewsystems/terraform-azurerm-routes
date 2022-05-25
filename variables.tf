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

variable "route_tables" {
  description = "Create Route Tables with routes"
  type = map(object({
    route_table_name              = string
    disable_bgp_route_propagation = string
    route_entries = map(object({
      route_name             = string
      address_prefix         = string
      next_hop_type          = string
      next_hop_in_ip_address = string
    }))
  }))
  default = null
}

variable "tags" {
  type        = map(any)
  description = "Resource tags"
  default = {
    environment = "test"
    managed_by  = "terratest"
  }
}