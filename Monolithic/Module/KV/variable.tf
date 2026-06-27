variable "rg_name" {
    type = string
}
variable "location" {
  type = string
}
variable "kvs" {
  type = map(object({
    secret_name = string
    secret_value = string
    kv_name = string
    secret_name2 = string
    secret_value2 = string
  }))
}