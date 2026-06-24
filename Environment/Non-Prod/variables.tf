variable "rg_name" {
  type        = string
  description = "input variable of resource group"
}

variable "location" {
  type        = string
  description = "input variable of location"
}

variable "rg" {
  description = "variable of rg"
  type = map(object({
    rg_name  = string
    location = string
    tags     = string
  }))
}

variable "vnet" {
  description = "variable of vnet"
  type = map(object({
    tags          = string
    address_space = list(string)
    dns_server    = list(string)
  }))
}


variable "subnet" {
  description = "variable of vnet"
  type = map(object({
    vnet_name      = string
    subnet_name    = string
    rg_name        = string
    address_prefix = list(string)
  }))
}

variable "nicc" {
  description = "variable of nic"
  type = map(object({
    nic_name    = string
    subnet_name = string
    vnet_name   = string
    ip_configuration = map(object({
      ip_name            = string
      private_ip_address = string
    }))
  }))
}

variable "nsg" {
  description = "variable of nic"
  type = map(object({
    nsg_name    = string
    location    = string
    rg_name     = string
    subnet_name = string
    vnet_name   = string
  }))
}

variable "vm" {
  description = "variable of vms"
  type = map(object({
    vm_name      = string
    rg_name      = string
    location     = string
    sku_size     = string
    nic_name     = string
    kv_name      = string
    secret_name1 = string
    secret_name2 = string
  }))
}

variable "pip" {
  description = "variable for public ip"
  type = map(object({
    pip_name = string
    location = string
    rg_name  = string
  }))
}

variable "bastion" {
  description = "variable for bastion host"
  type = map(object({
    bastion_name = string
    location     = string
    rg_name      = string
    pip_name     = string
    subnet_name  = string
    vnet_name    = string
    ip_config = map(object({
      ip_name = string
    }))
  }))
}


variable "kv" {
  type = map(object({
    secret_value  = string
    secret_name   = string
    kv_name       = string
    secret_value2 = string
    secret_name2  = string
  }))
}


variable "lb" {
  description = "variable for load balancer"
  type = map(object({
    lb_name  = string
    pip_name = optional(string)
    fip = map(object({
      fip_name = string
    }))
    backend_pool_name     = string
    fip_name              = string
    lbprobe_name          = string
    nic_name              = string
    ip_configuration_name = string
  }))
}
