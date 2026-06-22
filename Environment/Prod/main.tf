module "rg" {
  source = "../../Module/RG"
  rgs = var.rg
}

module "vnet" {
  source = "../../Module/VNET"
  vnets = var.vnet
  depends_on = [ module.rg ]
}

module "subnet" {
  source = "../../Module/Subnet"
  subnets = var.subnet
  depends_on = [ module.vnet ]
}

module "nic" {
  source = "../../Module/NIC"
  nic = var.nicc
  depends_on = [ module.subnet ]
}

module "nsg" {
  source = "../../Module/NSG"
  nsgs = var.nsg
  depends_on = [ module.subnet ]
}

module "vm" {
  source = "../../Module/VM"
  vms = var.vm
  depends_on = [ module.nic ]
}