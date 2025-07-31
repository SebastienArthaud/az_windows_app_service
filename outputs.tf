output "webapp_id" {
  description = "ID de la WebApp"
  value       = azurerm_windows_web_app.webappwindows.id
}

output "webapp_name" {
  description = "Nom de la WebApp"
  value       = azurerm_windows_web_app.webappwindows.name
}

output "webapp_credentials" {
  description = "Name and password of the default profile"
  value       = azurerm_windows_web_app.webappwindows.site_credential[0]
  sensitive   = true
}