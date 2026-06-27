variable "nsgs" {
  description = "variable of nic"
      type = map(object({
        nsg_name = string
        location = string
        rg_name = string
        subnet_name = string
        vnet_name = string
      }))
}
