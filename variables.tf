variable "name" {
  type        = string
  description = "Nom complet de la WebApp (ex: WAS-EUR-FR-INT-WEB-EMAILBUILDER-FRONT)"
}

variable "location" {
  type        = string
  description = "Localisation Azure"
  default     = "westeurope"
}

variable "resource_group_name" {
  type        = string
  description = "Nom du Resource Group"
}

variable "service_plan_id" {
  type        = string
  description = "ID du Service Plan pour héberger la WebApp"
}

variable "https_only" {
  type        = bool
  description = "Should the Linux Web App require HTTPS connections."
  default     = true
}

variable "identity_type" {
  type        = string
  description = "Type identité à activer sur la ressource ('UserAssigned' et 'SystemAssigned' sont les eules valeurs autorisées)"
  default     = "SystemAssigned"
}

variable "user_assigned_identity_id" {
  type        = string
  description = "ID de l'UAI"
}

variable "user_assigned_identity_client_id" {
  type        = string
  description = "Client ID de l'UAI"
  default     = null
}

variable "docker_registry_server_url" {
  type        = string
  description = "URL du Container Registry (ex: https://xxx.azurecr.io)"
  default     = null
}

variable "docker_image_name" {
  type        = string
  description = "Nom complet de l'image Docker (repo:tag)"
  default     = null
}

variable "appinsight_enabled" {
  type        = bool
  description = "Activer l'AppInsight (true/false)"
}

variable "application_insights_key" {
  type        = string
  description = "Instrumentation Key d'AppInsights"
  default     = ""
}

variable "application_insights_connection_str" {
  type        = string
  description = "Connection String d'AppInsights"
  default     = ""
}

variable "workspace_id" {
  type        = string
  description = "ID du Log Analytics Workspace"
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Map de tags"
  default     = {}
}

variable "virtual_network_subnet_id" {
  type        = string
  description = "ID du subnet utilisé pour le VNET integration"
  default     = null
}

variable "metric_category" {
  type        = string
  description = "The name of a Diagnostic Metric Category for this Resource"
  default     = "AllMetrics"
}

variable "metric_enabled" {
  type        = bool
  default     = false
  description = "Is this Diagnostic Metric enabled? Defaults to true"
}

variable "environment" {
  type        = string
  description = "Environnement de déploiement du key vault"
}

variable "enable_logs_analytics" {
  type        = bool
  description = "Activer ou non les log analytics (permet une meilleurs analyse des évènements)"
  default     = false
}


variable "dotnet_version" {
  type        = string
  description = "Version de dotnet installé"
  default     = null
}

variable "java_version" {
  type        = string
  description = "Version de java installé"
  default     = null
}

variable "java_server" {
  type        = string
  description = "type de serveur java installé"
  default     = null
}

variable "java_server_version" {
  type        = string
  description = "Version du serveur java installé"
  default     = null
}

variable "node_version" {
  type        = string
  description = "Version de node installé"
  default     = null
}
variable "php_version" {
  type        = string
  description = "Version de php installé"
  default     = null
}
variable "python_version" {
  type        = string
  description = "Version de python installé"
  default     = null
}
variable "ruby_version" {
  type        = string
  description = "Version de ruby installé"
  default     = null
}

variable "custom_app_settings" {
  type        = map(string)
  description = "Variables d'environnements personnalisées ajoutées à la webapp"
  default     = {}
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Autoriser l'accès public ?"
  default     = false
}

variable "private_endpoint_subnet_name" {
  type        = string
  description = "Subnet ou sera déployé le private endpoint"
  default     = null
}

variable "private_endpoint_virtual_network_name" {
  type        = string
  description = "VNET ou sera déployé le private endpoint"
  default     = null
}

variable "virtual_network_resource_group_name" {
  type        = string
  description = "Nom du resource group du réseau virtuel (VNET) ou sera créé le private endpoint, obligatoire si le storage account a un private endpoint"
  default     = null
}

variable "map_storage_account" {
  type        = bool
  description = "Définis ou non si la webapp est mappée à un file share, attention si activée, les variables mount_storage_account_name, mount_storage_account_access_key, mount_name et mount_share_name deviennent obligatoires"
  default     = false
}


variable "mount_storage_account_name" {
  type        = string
  default     = null
  description = "Nom du storage account à monter"
}

variable "mount_storage_account_access_key" {
  type        = string
  default     = null
  description = "access key du storage account à monter"
}

variable "mount_name" {
  type        = string
  default     = null
  description = "Nom du montage au niveau de la webapp"
}

variable "mount_share_name" {
  type        = string
  default     = null
  description = "Nom du file share à monter"
}

variable "app_command_line" {
  type        = string
  description = "startup command"
  default     = null
}


variable "client_affinity_enabled" {
  type        = bool
  description = "Should Client Affinity be enabled?"
  default     = false
}


variable "is_webapp_python" {
  type        = bool
  description = "Specifies whether this is a Python app"
  default     = false
}



variable "configure_app_logs" {
  type        = bool
  description = "Valeur facultative, si besoin de configurer les logs de l'app service, passer cete valeur à True"
  default     = false
}

variable "custom_app_http_logs" {
  type        = bool
  description = "Se besoin, passer cette valeur à True pour configurer les log http de l'app service"
  default     = false
}

variable "custom_logs_http_config_file_system" {
  type        = bool
  description = "Définis les paramétrages de rétention des logs http"
  default     = false
}

variable "custom_logs_http_config_file_system_retention" {
  type        = number
  description = "Définis la durée de rétention des logs http"
  default     = null

}

variable "custom_logs_http_config_file_system_retention_mb" {
  type        = number
  description = "Définis la taille maximale de rétention des logs http"
  default     = null
}

variable "custom_logs_detailed_error_messages" {
  type        = bool
  description = "Should Detailed error messages be enabled on this App Service ?"
  default     = false
}

variable "custom_logs_failed_request_tracing" {
  type        = bool
  description = "Should Failed request tracing be enabled on this App Service?"
  default     = false
}


variable "http2_enabled" {
  type        = bool
  description = "Should the HTTP2 be enabled?"
  default     = true
}

variable "ip_restriction_default_action" {
  type        = string
  description = "The Default action for traffic that does not match any ip_restriction rule. possible values include Allow and Deny"
  default     = "Allow"
}

variable "minimum_tls_version" {
  type        = string
  description = "The configures the minimum version of TLS required for SSL requests. Possible values include: 1.0, 1.1, 1.2 and 1.3"
  default     = "1.3"
}


variable "scm_ip_restriction_default_action" {
  type        = string
  description = "he Default action for traffic that does not match any scm_ip_restriction rule. possible values include Allow and Deny"
  default     = "Allow"
}

variable "create_slot" {
  type        = bool
  description = "Variable définissant la création d'un slot ou pas"
  default     = false
}

variable "slot_custom_name" {
  type        = string
  description = "Nom personnalisé du slot de la webapp"
  default     = null
}


variable "enable_Microsoft_auth" {
  type        = bool
  description = "Active ou non l'authentification Microsoft"
  default     = false
}

variable "microsoft_v2_client_id" {
  type        = string
  description = "The OAuth 2.0 client ID that was created for the app used for authentication."
  default     = null
}

variable "microsoft_v2_tenant_id" {
  type        = string
  description = "Tenant ID utilisé en cas d'authentification MS activée"
  default     = "f30ac191-b8b4-45f2-9a9b-e5466cb90c2f"
}

variable "microsoft_v2_auth_secret" {
  type        = string
  description = "Secret utilisé par la webapp pour s'authentifier avec le SPN qui fera la passerelle d'authentification entre la webapp et ENtra ID"
  default     = null
}

variable "auth_logout_endpoint" {
  type        = string
  description = "The endpoint to which logout requests should be made"
  default     = null
}