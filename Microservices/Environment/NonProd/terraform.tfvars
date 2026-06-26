rg_name  = "np-tf-rg"
location = "central india"

rg = {
  "rg1" = {
    rg_name  = "np-tf-rg"
    location = "central india"
  }
}

acrs = {
  "acr1" = {
    acr_name      = "nptfacr"
    sku           = "Standard"
    admin_enabled = false
  }
}

akss = {
  "aks1" = {
    aks_name   = "np-tf-aks"
    dns_prefix = "np-aks"
    node_pool = {
      "node1" = {
        node_name  = "default"
        node_count = 1
        vm_size    = "Standard_D2_v2"
      }
    }
    identity = {
      "id1" = {
        type = "SystemAssigned"
      }
    }
  }
}
