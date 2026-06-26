variable "bastions" {
  description = "variable for bastion host"
  type = map(object({
    bastion_name = string
    location     = string
    rg_name      = string
    pip_name     = string
    vnet_name    = string
    subnet_name  = string
    ip_config = map(object({
      ip_name = string
    }))
  }))
}
