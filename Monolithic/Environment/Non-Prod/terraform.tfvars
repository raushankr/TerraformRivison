rg_name  = "np-terraform-rg"
location = "central india"

rg = {
  rg1 = {
    rg_name  = "np-terraform-rg"
    location = "central india"
    tags     = "non-prod-env"
  }
}

vnet = {
  "np-tfvnet" = {
    tags          = "non-prod-vnet"
    address_space = ["10.0.0.0/16"]
    dns_server    = ["8.8.8.8"]
  }
}

subnet = {
  subnet1 = {
    vnet_name      = "np-tfvnet"
    subnet_name    = "np-tfsubnet"
    rg_name        = "np-terraform-rg"
    address_prefix = ["10.0.1.0/24"]
  }
  subnet2 = {
    vnet_name      = "np-tfvnet"
    subnet_name    = "AzureBastionSubnet"
    rg_name        = "np-terraform-rg"
    address_prefix = ["10.0.224.0/24"]
  }
  subnet3 = {
    vnet_name      = "np-tfvnet"
    subnet_name    = "np-appsubnet"
    rg_name        = "np-terraform-rg"
    address_prefix = ["10.0.2.0/24"]
  }
}

nicc = {
  nicc1 = {
    nic_name    = "np-tfnic"
    subnet_name = "np-tfsubnet"
    vnet_name   = "np-tfvnet"
    ip_configuration = {
      ip_config1 = {
        ip_name            = "internal"
        private_ip_address = "Dynamic"
      }
    }
  }
  nicc2 = {
    nic_name    = "np-tfnic2"
    subnet_name = "np-appsubnet"
    vnet_name   = "np-tfvnet"
    ip_configuration = {
      ip_config1 = {
        ip_name            = "internal"
        private_ip_address = "Dynamic"
      }
    }
  }
}

nsg = {
  nsg1 = {
    nsg_name    = "np-tfnsg"
    location    = "central india"
    rg_name     = "np-terraform-rg"
    subnet_name = "np-tfsubnet"
    vnet_name   = "np-tfvnet"
  }
  nsg2 = {
    nsg_name    = "np-tfnsg2"
    location    = "central india"
    rg_name     = "np-terraform-rg"
    subnet_name = "np-appsubnet"
    vnet_name   = "np-tfvnet"
  }
}

vm = {
  vm1 = {
    vm_name      = "np-tfvm"
    location     = "central india"
    rg_name      = "np-terraform-rg"
    sku_size     = "Standard_B1s"
    nic_name     = "np-tfnic"
    kv_name      = "specifickv011"
    secret_name1 = "username"
    secret_name2 = "password"
  }
  vm2 = {
    vm_name      = "np-appvm"
    location     = "central india"
    rg_name      = "np-terraform-rg"
    sku_size     = "Standard_B1s"
    nic_name     = "np-tfnic2"
    kv_name      = "specifickv011"
    secret_name1 = "username"
    secret_name2 = "password"
  }
}

pip = {
  "pip1" = {
    pip_name = "np-pip1"
    location = "central india"
    rg_name  = "np-terraform-rg"
  }
  "pip2" = {
    pip_name = "np-lbpip2"
    location = "central india"
    rg_name  = "np-terraform-rg"
  }
}

bastion = {
  "bastion1" = {
    bastion_name = "np-bastion1"
    location     = "centralindia"
    rg_name      = "np-terraform-rg"
    pip_name     = "np-pip1"
    subnet_name  = "AzureBastionSubnet"
    vnet_name    = "np-tfvnet"
    ip_config = {
      ip_config1 = {
        ip_name = "configuration"
      }
    }
  }
}


kv = {
  kv1 = {
    secret_name   = "username"
    secret_value  = "azureadmin"
    kv_name       = "specifickv011"
    secret_name2  = "password"
    secret_value2 = "P@ssword1234"
  }
}

lb = {
  lb1 = {
    lb_name  = "public_lb"
    pip_name = "np-lbpip2"
    fip = {
      fip1 = {
        fip_name = "PublicIPAddress"
      }
    }
    backend_pool_name     = "public_lb_pool"
    fip_name              = "PublicIPAddress"
    lbprobe_name          = "public_lb_probe"
    nic_name              = "np-tfnic"
    ip_configuration_name = "internal"
  }
}
