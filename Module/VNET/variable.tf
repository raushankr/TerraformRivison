variable "vnets" {
  description = "variable of vnet"
  type = map(object({
    vnet_name     = string
    location      = string
    tags          = string
    rg_name       = string
    address_space = list(string)
    dns_server    = list(string)
  }))
}
