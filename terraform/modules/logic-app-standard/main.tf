resource "azurerm_logic_app_standard" "this" {

  name                       = var.logic_app_name
  location                   = var.location
  resource_group_name        = var.resource_group_name

  app_service_plan_id        = var.app_service_plan_id
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key

  version = "~4"

  identity {
    type = "SystemAssigned"
  }

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME" = "dotnet"
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }

  tags = var.tags
}