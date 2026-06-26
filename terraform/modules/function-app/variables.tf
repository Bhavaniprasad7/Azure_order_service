variable "function_app_name" {}

variable "resource_group_name" {}

variable "location" {}

variable "service_plan_id" {}

variable "storage_account_name" {}

variable "storage_account_access_key" {
  sensitive = true
}