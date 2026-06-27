variable "rgs" {
    description = "variable of rg"
  type = map(object({
    rg_name = string
    location = string
  }))
}