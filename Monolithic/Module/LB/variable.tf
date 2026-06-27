variable "rg_name" {
  type = string
}
variable "location" {
  type = string
}
variable "lbs" {
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
