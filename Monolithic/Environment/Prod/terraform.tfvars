rg = {
  rg1 = {
    rg_name  = "terraform-rg"
    location = "central india"
    tags     = "prod-env"
  }
}

vnet = {
  vnet1 = {
    vnet_name     = "tfvnet"
    location      = "central india"
    tags          = "prod-vnet"
    rg_name       = "terraform-rg"
    address_space = ["10.0.0.0/16"]
    dns_server    = ["8.8.8.8"]
  }
}

subnet = {
  subnet1 = {
        vnet_name     = "tfvnet"
    subnet_name        = "tfsubnet"
    rg_name       = "terraform-rg"
    address_prefix = ["10.0.1.0/24"]
  }
}

nicc = {
  nicc1 = {
          nic_name = "tfnic"
      location = "centralindia"
      rg_name =  "terraform-rg"
       subnet_name = "tfsubnet"
       vnet_name = "tfvnet"
       ip_configuration = {
        ip_config1 = {
        ip_name  = "internal"
        private_ip_address = "Dynamic"
        }
  }
}
}

nsg = {
  nsg1 = {
            nsg_name = "tfnsg"
        location = "central india"
      rg_name =  "terraform-rg"
       subnet_name = "tfsubnet"
       vnet_name = "tfvnet"
  }
}

vm = {
  vm1 ={
        vm_name = "tfvm"
        location = "central india"
      rg_name =  "terraform-rg"
    sku_size = "Standard_B1s"
    username = "azureuser"
    password = "P@ssword1234"
    nic_name = "tfnic"
  }
}

