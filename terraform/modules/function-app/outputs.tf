output "function_app_name" {
  value = azurerm_windows_function_app.this.name
}

output "default_hostname" {
  value = azurerm_windows_function_app.this.default_hostname
}