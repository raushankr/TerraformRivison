variable "rg_name" {
  type        = string
  description = "input variable of resource group"
}

variable "location" {
  type = string
}


variable "perring" {
  description = "Vnet_perring"
  type = map(object({
    vnet_peeriing_name1  = string
    vnet_peeriing_name2  = string
    virtual_network_name1 = string
    virtual_network_name2 = string

  }))

}
