variable "subnets" {
  description = "variable of vnet"
  type = map(object({
    vnet_name     = string
    subnet_name       = string
    rg_name       = string
    address_prefix = list(string)
  }))
}
