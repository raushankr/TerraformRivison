variable "rg_name" {
  type        = string
  description = "input variable of resource group"
}

variable "location" {
  type        = string
}

variable "nic" {
  description = "variable of nic"
    type = map(object({
      nic_name = string
       subnet_name = string
       vnet_name = string
       ip_configuration = map(object({
        ip_name  = string
        private_ip_address = string
       }))
    }))
}