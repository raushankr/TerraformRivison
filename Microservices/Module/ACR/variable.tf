variable "rg_name" {
  type = string
}
variable "location" {
  type = string
}
variable "acr" {
  description = "variable of acr"
    type = map(object({
     acr_name = string
     sku = string
     admin_enabled = bool
    }))
}