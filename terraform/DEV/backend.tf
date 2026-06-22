terraform {
  backend "azurerm" {
    resource_group_name  = "RG-AIS-DEV-ORP"
    storage_account_name = "saaisdevorp"
    container_name       = "terraform-state-file"
    key                  = "dev.terraform.tfstate"
  }
}