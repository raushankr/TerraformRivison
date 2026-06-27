module "rg" {
  source = "../../Module/RG"
  rgs = var.rg
}

module "aks" {
  source = "../../Module/AKS"
  aks = var.akss
  rg_name = var.rg_name
  location = var.location
  depends_on = [ module.rg ]
}

module "acr" {
  source = "../../Module/ACR"
  acr = var.acrs
  rg_name = var.rg_name
  location = var.location
  depends_on = [ module.rg ]
}