resource "azurerm_lb" "tf-lb" {
  for_each            = var.lbs
  name                = each.value.lb_name
  location            = var.location
  resource_group_name = var.rg_name

  dynamic "frontend_ip_configuration" {
    for_each = each.value.fip
    content {
      name                 = frontend_ip_configuration.value.fip_name
      public_ip_address_id = data.azurerm_public_ip.tf-lbpip[each.key].id
    }
  }
}

###### backend pool ko vm se attach karna hai #############
resource "azurerm_network_interface_backend_address_pool_association" "tf-backendpoolassociation" {
  for_each                = var.lbs
  network_interface_id    = data.azurerm_network_interface.tf-nic[each.key].id
  ip_configuration_name   = each.value.ip_configuration_name
  backend_address_pool_id = azurerm_lb_backend_address_pool.tf-lbbp[each.key].id
}


resource "azurerm_lb_backend_address_pool" "tf-lbbp" {
  for_each        = var.lbs
  loadbalancer_id = azurerm_lb.tf-lb[each.key].id
  name            = each.value.backend_pool_name
}

resource "azurerm_lb_rule" "tf-lbrule" {
  for_each                       = var.lbs
  loadbalancer_id                = azurerm_lb.tf-lb[each.key].id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = each.value.fip_name
  backend_address_pool_ids = [
    azurerm_lb_backend_address_pool.tf-lbbp[each.key].id
  ]
  probe_id = azurerm_lb_probe.tf-lbprobe[each.key].id
}

resource "azurerm_lb_probe" "tf-lbprobe" {
  for_each        = var.lbs
  loadbalancer_id = azurerm_lb.tf-lb[each.key].id
  name            = each.value.lbprobe_name
  port            = 80
}
