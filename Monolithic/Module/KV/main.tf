data "azurerm_client_config" "current" {}
resource "azurerm_key_vault" "tf-kv" {
    for_each = var.kvs
  name                        = each.value.kv_name
  location                    = var.location
  resource_group_name         = var.rg_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get", "Delete", "List"
    ]

    secret_permissions = [
      "Get", "Set", "Delete", "List", "Recover", "Purge"
    ]

    storage_permissions = [
      "Get",
    ]
  }
  tags = {
    "env" = "prod"
  }
}

resource "azurerm_key_vault_secret" "tf-kv-secret" {
    for_each = var.kvs
  name         = each.value.secret_name
  value        = each.value.secret_value
  key_vault_id = azurerm_key_vault.tf-kv[each.key].id
}

resource "azurerm_key_vault_secret" "tf-kv-secret2" {
    for_each = var.kvs
  name         = each.value.secret_name2
  value        = each.value.secret_value2
  key_vault_id = azurerm_key_vault.tf-kv[each.key].id
}