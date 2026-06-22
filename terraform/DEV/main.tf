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