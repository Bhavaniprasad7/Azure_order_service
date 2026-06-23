module "rg" {
  source   = "../modules/resource-group"

  rg_name  = var.resource_group_name
  location = var.location
}

module "storage_account" {
  source = "../modules/storage-account"

  storage_account_name = var.storage_account_name

  resource_group_name = var.resource_group_name
  location            = var.location

  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  container_name        = var.container_name
  container_access_type = var.container_access_type

  tags = {
    Environment = "DEV"
    Project     = "AIS"
    ManagedBy   = "Terraform"
  }
}

module "keyvault" {
  source = "../modules/keyvault"

  keyvault_name      = var.keyvault_name
  location           = var.location
  resource_group_name = var.resource_group_name
  tenant_id          = var.tenant_id

  sku_name = "standard"

  tags = {
    Environment = "DEV"
    Application = "AIS"
    ManagedBy   = "Terraform"
  }
}

module "app_service_plan" {

  source = "../modules/app-service-plan"

  plan_name           = "asp-ais-dev"
  resource_group_name = var.resource_group_name
  location            = var.location

  tags = {
    Environment = "DEV"
  }
}

module "logic_app_standard" {

  source = "../modules/logic-app-standard"

  logic_app_name      = "la-ais-dev"
  resource_group_name = var.resource_group_name
  location            = var.location

  app_service_plan_id = module.app_service_plan.id

  storage_account_name       = module.storage_account.storage_account_name
  storage_account_access_key = module.storage_account.primary_access_key

  tags = {
    Environment = "DEV"
  }
}