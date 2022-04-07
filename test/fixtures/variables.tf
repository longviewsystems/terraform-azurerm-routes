variable "location" {
  type        = string
  description = "The Location where RG is created"
  default     = "westus2"
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
  default     = {}
}