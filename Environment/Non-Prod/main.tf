module "rg" {
  source = "../../Module/RG"
  rgs = var.rg
}

module "vnet" {
  source = "../../Module/VNET"
  vnets = var.vnet
  depends_on = [ module.rg ]
  location = var.location
  rg_name = var.rg_name
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
  rg_name = var.rg_name
  location = var.location
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

module "pip" {
  source = "../../Module/PIP"
  pips = var.pip
  depends_on = [ module.rg ]
}

module "bastion" {
  source = "../../Module/Bastion"
  bastions = var.bastion
  depends_on = [ module.vnet, module.subnet, module.pip ]
}

module "kv" {
  source = "../../Module/KV"
  kvs = var.kv
  depends_on = [ module.rg ]
  rg_name = var.rg_name
  location = var.location
}