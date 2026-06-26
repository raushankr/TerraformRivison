variable "rg_name" {
  type = string
}
variable "location" {
  type = string
}
variable "aks" {
  description = "variable for aks cluster"
  type = map(object({
    aks_name = string
    dns_prefix = string
    node_pool = map(object({
      node_name = string
      node_count = number
      vm_size = string
    }))
    identity = map(object({
      type = string
    }))
  }))
}