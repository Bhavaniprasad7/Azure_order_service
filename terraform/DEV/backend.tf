terraform {
  backend "azurerm" {
    resource_group_name  = "RRG-AIS-DEV-TFSTATE"
    storage_account_name = "saasidevtf"
    container_name       = "terraform-state-file"
    key                  = "dev.terraform.tfstate"
  }
}