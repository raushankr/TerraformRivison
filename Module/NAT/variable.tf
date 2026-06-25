variable "rg_name" {
  type        = string
  description = "input variable of resource group"
}

variable "location" {
  type        = string
}

variable "nat" {
    description = "Variable of NAT Gate"
    type = map(object({
      nat_name = string
      sku_name = string
      pip_name = string
      subnet_name = string
      vnet_name = string
    }))
    
  
}