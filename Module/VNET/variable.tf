variable "rg_name" {
  type        = string
  description = "input variable of resource group"
}

variable "location" {
  type        = string
  description = "input variable of location"
}
variable "vnets" {
  description = "variable of vnet"
  type = map(object({
    tags          = string
    address_space = list(string)
    dns_server    = list(string)
  }))
}
