variable "vms" {
  description = "variable of vms"
  type = map(object({
    vm_name = string
    rg_name = string
    location = string
    sku_size = string
    nic_name = string
    kv_name = string
    secret_name1 = string
    secret_name2 = string
  }))
}