variable "pips" {
  description = "variable for public ip"
  type = map(object({
    pip_name = string
    location = string
    rg_name = string
  }))
}