locals {
  private_endpoint_name      = "PEP-EUR-FR-${var.environment}-${upper(var.name)}"
  slot_private_endpoint_name = "PEP-EUR-FR-${var.environment}-${upper(var.name)}-SLOT"
}

resource "azurerm_windows_web_app" "webappwindows" {
  name                      = var.name
  location                  = var.location
  resource_group_name       = var.resource_group_name
  service_plan_id           = var.service_plan_id
  https_only                = var.https_only
  virtual_network_subnet_id = var.virtual_network_subnet_id
  # Permet de référencer le Key Vault via l'UAI
  key_vault_reference_identity_id = var.user_assigned_identity_id
  public_network_access_enabled   = var.public_network_access_enabled
  client_affinity_enabled         = var.client_affinity_enabled

  site_config {
    minimum_tls_version               = var.minimum_tls_version
    ftps_state                        = "Disabled"
    http2_enabled                     = var.http2_enabled
    always_on                         = true
    ip_restriction_default_action     = var.ip_restriction_default_action
    scm_ip_restriction_default_action = var.scm_ip_restriction_default_action
    # Startup command
    app_command_line = var.app_command_line


    # Utilisation de l'UAI pour le pull d'images depuis ACR
    container_registry_managed_identity_client_id = var.docker_registry_server_url != null && var.docker_image_name != null ? var.user_assigned_identity_client_id : null
    container_registry_use_managed_identity       = var.docker_registry_server_url != null && var.docker_image_name != null ? true : false

    # Docker stack
    application_stack {

      docker_image_name   = var.docker_registry_server_url != null && var.docker_image_name != null ? var.docker_image_name : null
      docker_registry_url = var.docker_registry_server_url != null && var.docker_image_name != null ? var.docker_registry_server_url : null
      # Si besoin : docker_registry_username / docker_registry_password si pas en UAI

      dotnet_version = var.dotnet_version != null ? var.dotnet_version : null

      java_version = var.java_version != null && var.java_server != null && var.java_server_version != null ? var.java_version : null

      node_version = var.node_version != null ? var.node_version : null

      php_version = var.php_version != null ? var.php_version : null

      python = var.is_webapp_python
    }

    cors {
      support_credentials = true
      # allowed_origins = [...]
    }
  }

  dynamic "auth_settings_v2" {
    for_each = var.enable_Microsoft_auth == true ? toset([1]) : toset([])
    content {
      auth_enabled           = true
      require_authentication = true
      unauthenticated_action = "RedirectToLoginPage"
      default_provider       = "azureactivedirectory"
      login {
        token_store_enabled = true
        logout_endpoint     = var.auth_logout_endpoint
      }

      active_directory_v2 {
        allowed_applications        = [var.microsoft_v2_client_id]
        client_id                   = var.microsoft_v2_client_id
        client_secret_setting_name  = "MICROSOFT_PROVIDER_AUTHENTICATION_SECRET"
        tenant_auth_endpoint        = "https://sts.windows.net/${var.microsoft_v2_tenant_id}/v2.0"
        www_authentication_disabled = false
      }
    }
  }

  dynamic "identity" {
    for_each = var.identity_type == "UserAssigned" ? toset([1]) : toset([])
    content {
      type         = var.identity_type
      identity_ids = [var.user_assigned_identity_id]
    }
  }

  # App Settings
  app_settings = merge(
    var.custom_app_settings,
    var.enable_Microsoft_auth == true ? {
      "MICROSOFT_PROVIDER_AUTHENTICATION_SECRET" = var.microsoft_v2_auth_secret
      "WEBSITE_AUTH_AAD_ALLOWED_TENANTS"         = var.microsoft_v2_tenant_id
    } : {},
    var.appinsight_enabled == true ? {
      "ApplicationInsightsAgent_EXTENSION_VERSION" = "~3",
      "APPINSIGHTS_INSTRUMENTATIONKEY"             = var.application_insights_key,
      "APPLICATIONINSIGHTS_CONNECTION_STRING"      = var.application_insights_connection_str
    } : {}
  )

  tags = var.tags

  dynamic "storage_account" {
    for_each = var.map_storage_account == true ? toset([1]) : toset([])

    content {
      account_name = var.mount_storage_account_name
      access_key   = var.mount_storage_account_access_key
      name         = var.mount_name
      share_name   = var.mount_share_name
      type         = "AzureFiles"
      mount_path   = "C:\\AzureFile"
    }


  }

  dynamic "logs" {
    for_each = var.configure_app_logs == true ? toset([1]) : toset([])
    content {
      dynamic "http_logs" {
        for_each = var.custom_app_http_logs == true ? toset([1]) : toset([])
        content {
          dynamic "file_system" {
            for_each = var.custom_logs_http_config_file_system == true ? toset([1]) : toset([])
            content {
              retention_in_days = var.custom_logs_http_config_file_system_retention
              retention_in_mb   = var.custom_logs_http_config_file_system_retention_mb
            }
          }
        }
      }
      detailed_error_messages = var.custom_logs_detailed_error_messages
      failed_request_tracing  = var.custom_logs_failed_request_tracing
    }
  }

}

resource "azurerm_windows_web_app_slot" "webappwindows_slot" {
  count                     = var.create_slot == true ? 1 : 0
  app_service_id            = azurerm_windows_web_app.webappwindows.id
  name                      = var.slot_custom_name == null ? "${var.name}-SLOT" : var.slot_custom_name
  https_only                = var.https_only
  virtual_network_subnet_id = var.virtual_network_subnet_id
  # Permet de référencer le Key Vault via l'UAI
  key_vault_reference_identity_id = var.user_assigned_identity_id
  public_network_access_enabled   = var.public_network_access_enabled
  client_affinity_enabled         = var.client_affinity_enabled

  site_config {
    minimum_tls_version               = var.minimum_tls_version
    ftps_state                        = "Disabled"
    http2_enabled                     = var.http2_enabled
    always_on                         = true
    ip_restriction_default_action     = var.ip_restriction_default_action
    scm_ip_restriction_default_action = var.scm_ip_restriction_default_action
    # Startup command
    app_command_line = var.app_command_line


    # Utilisation de l'UAI pour le pull d'images depuis ACR
    container_registry_managed_identity_client_id = var.docker_registry_server_url != null && var.docker_image_name != null ? var.user_assigned_identity_client_id : null
    container_registry_use_managed_identity       = var.docker_registry_server_url != null && var.docker_image_name != null ? true : false

    # Docker stack
    application_stack {

      docker_image_name   = var.docker_registry_server_url != null && var.docker_image_name != null ? var.docker_image_name : null
      docker_registry_url = var.docker_registry_server_url != null && var.docker_image_name != null ? var.docker_registry_server_url : null
      # Si besoin : docker_registry_username / docker_registry_password si pas en UAI

      dotnet_version = var.dotnet_version != null ? var.dotnet_version : null

      java_version = var.java_version != null && var.java_server != null && var.java_server_version != null ? var.java_version : null

      node_version = var.node_version != null ? var.node_version : null

      php_version = var.php_version != null ? var.php_version : null

      python = var.is_webapp_python
    }

    cors {
      support_credentials = true
      # allowed_origins = [...]
    }
  }

  dynamic "identity" {
    for_each = var.identity_type == "UserAssigned" ? toset([1]) : toset([])
    content {
      type         = var.identity_type
      identity_ids = [var.user_assigned_identity_id]
    }
  }

  # App Settings
  app_settings = merge(
    var.custom_app_settings,
    var.appinsight_enabled == true ? {
      "ApplicationInsightsAgent_EXTENSION_VERSION" = "~3",
      "APPINSIGHTS_INSTRUMENTATIONKEY"             = var.application_insights_key,
      "APPLICATIONINSIGHTS_CONNECTION_STRING"      = var.application_insights_connection_str
    } : {}
  )

  tags = var.tags

  dynamic "storage_account" {
    for_each = var.map_storage_account == true ? toset([1]) : toset([])

    content {
      account_name = var.mount_storage_account_name
      access_key   = var.mount_storage_account_access_key
      name         = var.mount_name
      share_name   = var.mount_share_name
      type         = "AzureFiles"
      mount_path   = "C:\\AzureFile"
    }


  }

  dynamic "logs" {
    for_each = var.configure_app_logs == true ? toset([1]) : toset([])
    content {
      dynamic "http_logs" {
        for_each = var.custom_app_http_logs == true ? toset([1]) : toset([])
        content {
          dynamic "file_system" {
            for_each = var.custom_logs_http_config_file_system == true ? toset([1]) : toset([])
            content {
              retention_in_days = var.custom_logs_http_config_file_system_retention
              retention_in_mb   = var.custom_logs_http_config_file_system_retention_mb
            }
          }
        }
      }
      detailed_error_messages = var.custom_logs_detailed_error_messages
      failed_request_tracing  = var.custom_logs_failed_request_tracing
    }
  }

}


module "app_service_private_endpoint" {
  count                               = var.public_network_access_enabled == false ? 1 : 0
  source                              = "../azure_private_endpoint"
  private_endpoint_name               = local.private_endpoint_name
  subnet_name                         = var.private_endpoint_subnet_name
  virtual_network_name                = var.private_endpoint_virtual_network_name
  virtual_network_resource_group_name = var.virtual_network_resource_group_name
  resource_group_name                 = var.resource_group_name
  private_connection_resource_id      = azurerm_windows_web_app.webappwindows.id
  subresourceType                     = "sites"
}

#module "app_service_slot_private_endpoint" {
#  count                               = var.public_network_access_enabled == false && var.create_slot == true ? 1 : 0
#  source                              = "../azure_private_endpoint"
#  private_endpoint_name               = local.slot_private_endpoint_name
#  subnet_name                         = var.private_endpoint_subnet_name
#  virtual_network_name                = var.private_endpoint_virtual_network_name
#  virtual_network_resource_group_name = var.virtual_network_resource_group_name
#  resource_group_name                 = var.resource_group_name
#  private_connection_resource_id      = azurerm_windows_web_app_slot.webappwindows_slot[0].id
#  subresourceType                     = "sites-staging"
#}


resource "azurerm_monitor_diagnostic_setting" "webappwindows" {
  count                      = var.enable_logs_analytics == true ? 1 : 0
  name                       = "diagnostic"
  target_resource_id         = azurerm_windows_web_app.webappwindows.id
  log_analytics_workspace_id = var.workspace_id

  depends_on = [azurerm_windows_web_app.webappwindows]

  metric {
    category = var.metric_category
    enabled  = var.metric_enabled
  }

  enabled_log {
    category = "AppServiceHTTPLogs"
  }
  enabled_log {
    category = "AppServiceConsoleLogs"
  }
  enabled_log {
    category = "AppServiceAppLogs"
  }
  enabled_log {
    category = "AppServiceAuditLogs"
  }
}