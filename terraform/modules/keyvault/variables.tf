variable "keyvault_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "sku_name" {
  type    = string
  default = "standard"
}

variable "enable_rbac_authorization" {
  type    = bool
  default = true
}

variable "tags" {
  type    = map(string)
  default = {}
}