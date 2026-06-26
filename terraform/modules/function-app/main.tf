resource "azurerm_windows_function_app" "this" {

  name                = var.function_app_name
  location            = var.location
  resource_group_name = var.resource_group_name

  service_plan_id = var.service_plan_id

  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key

  functions_extension_version = "~4"

  site_config {
    application_stack {
      dotnet_version = "v8.0"
    }
  }

  app_settings = {

    "FUNCTIONS_WORKER_RUNTIME" = "dotnet-isolated"

    "WEBSITE_RUN_FROM_PACKAGE" = "1"

  }

}