variable "rg" {
    description = "variable of rg"
  type = map(object({
    rg_name = string
    location = string
    tags = string
  }))
}

variable "vnet" {
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


variable "subnet" {
  description = "variable of vnet"
  type = map(object({
    vnet_name     = string
    subnet_name      = string
    rg_name       = string
    address_prefix = list(string)
  }))
}

variable "nicc" {
  description = "variable of nic"
    type = map(object({
      nic_name = string
      location = string
      rg_name =  string
       subnet_name = string
       vnet_name = string
       ip_configuration = map(object({
        ip_name  = string
        private_ip_address = string
       }))
    }))
}

variable "nsg" {
  description = "variable of nic"
      type = map(object({
        nsg_name = string
        location = string
        rg_name = string
        subnet_name = string
        vnet_name = string
      }))
}

variable "vm" {
  description = "variable of vms"
  type = map(object({
    vm_name = string
    rg_name = string
    location = string
    sku_size = string
    username = string
    password = string
    nic_name = string
  }))
}
