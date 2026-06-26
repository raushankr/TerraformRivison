variable "rg_name" {
  type = string
}
variable "location" {
  type = string
}
variable "acrs" {
  description = "variable of acr"
  type = map(object({
    acr_name      = string
    sku           = string
    admin_enabled = bool
  }))
}

variable "akss" {
  description = "variable for aks cluster"
  type = map(object({
    aks_name   = string
    dns_prefix = string
    node_pool = map(object({
      node_name  = string
      node_count = number
      vm_size    = string
    }))
    identity = map(object({
      type = string
    }))
  }))
}

variable "rg" {
  description = "variable of rg"
  type = map(object({
    rg_name  = string
    location = string
  }))
}
