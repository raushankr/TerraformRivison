data "azurerm_network_interface" "tf-nic" {
    for_each = var.vms
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}
data "azurerm_key_vault" "tf-kv" {
  for_each = var.vms
  name                = each.value.kv_name
  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault_secret" "tf-kvsecret" {
  for_each = var.vms
  name         = each.value.secret_name1
  key_vault_id = data.azurerm_key_vault.tf-kv[each.key].id
}

data "azurerm_key_vault_secret" "tf-kvsecret2" {
  for_each = var.vms
  name         = each.value.secret_name2
  key_vault_id = data.azurerm_key_vault.tf-kv[each.key].id
}
