resource "azurerm_linux_virtual_machine" "tf-vm" {
    for_each = var.vms
  name                = each.value.vm_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  size                = each.value.sku_size
  disable_password_authentication = false
  admin_username      = data.azurerm_key_vault_secret.tf-kvsecret[each.key].value
  admin_password =   data.azurerm_key_vault_secret.tf-kvsecret2[each.key].value

  network_interface_ids = [
    data.azurerm_network_interface.tf-nic[each.key].id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}