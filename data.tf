data "azuread_application" "app_registration" {
  display_name = var.microsoft_auth_app_registration_name
}