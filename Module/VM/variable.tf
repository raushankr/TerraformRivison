variable "vms" {
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