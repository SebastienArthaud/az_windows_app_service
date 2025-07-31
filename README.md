<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app_service_private_endpoint"></a> [app\_service\_private\_endpoint](#module\_app\_service\_private\_endpoint) | ../azure_private_endpoint | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_monitor_diagnostic_setting.webappwindows](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_windows_web_app.webappwindows](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_web_app) | resource |
| [azurerm_windows_web_app_slot.webappwindows_slot](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_web_app_slot) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_appinsight_enabled"></a> [appinsight\_enabled](#input\_appinsight\_enabled) | Activer l'AppInsight (true/false) | `bool` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environnement de déploiement du key vault | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Nom complet de la WebApp (ex: WAS-EUR-FR-INT-WEB-EMAILBUILDER-FRONT) | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Nom du Resource Group | `string` | n/a | yes |
| <a name="input_service_plan_id"></a> [service\_plan\_id](#input\_service\_plan\_id) | ID du Service Plan pour héberger la WebApp | `string` | n/a | yes |
| <a name="input_user_assigned_identity_id"></a> [user\_assigned\_identity\_id](#input\_user\_assigned\_identity\_id) | ID de l'UAI | `string` | n/a | yes |
| <a name="input_app_command_line"></a> [app\_command\_line](#input\_app\_command\_line) | startup command | `string` | `null` | no |
| <a name="input_application_insights_connection_str"></a> [application\_insights\_connection\_str](#input\_application\_insights\_connection\_str) | Connection String d'AppInsights | `string` | `""` | no |
| <a name="input_application_insights_key"></a> [application\_insights\_key](#input\_application\_insights\_key) | Instrumentation Key d'AppInsights | `string` | `""` | no |
| <a name="input_auth_logout_endpoint"></a> [auth\_logout\_endpoint](#input\_auth\_logout\_endpoint) | The endpoint to which logout requests should be made | `string` | `null` | no |
| <a name="input_client_affinity_enabled"></a> [client\_affinity\_enabled](#input\_client\_affinity\_enabled) | Should Client Affinity be enabled? | `bool` | `false` | no |
| <a name="input_configure_app_logs"></a> [configure\_app\_logs](#input\_configure\_app\_logs) | Valeur facultative, si besoin de configurer les logs de l'app service, passer cete valeur à True | `bool` | `false` | no |
| <a name="input_create_slot"></a> [create\_slot](#input\_create\_slot) | Variable définissant la création d'un slot ou pas | `bool` | `false` | no |
| <a name="input_custom_app_http_logs"></a> [custom\_app\_http\_logs](#input\_custom\_app\_http\_logs) | Se besoin, passer cette valeur à True pour configurer les log http de l'app service | `bool` | `false` | no |
| <a name="input_custom_app_settings"></a> [custom\_app\_settings](#input\_custom\_app\_settings) | Variables d'environnements personnalisées ajoutées à la webapp | `map(string)` | `{}` | no |
| <a name="input_custom_logs_detailed_error_messages"></a> [custom\_logs\_detailed\_error\_messages](#input\_custom\_logs\_detailed\_error\_messages) | Should Detailed error messages be enabled on this App Service ? | `bool` | `false` | no |
| <a name="input_custom_logs_failed_request_tracing"></a> [custom\_logs\_failed\_request\_tracing](#input\_custom\_logs\_failed\_request\_tracing) | Should Failed request tracing be enabled on this App Service? | `bool` | `false` | no |
| <a name="input_custom_logs_http_config_file_system"></a> [custom\_logs\_http\_config\_file\_system](#input\_custom\_logs\_http\_config\_file\_system) | Définis les paramétrages de rétention des logs http | `bool` | `false` | no |
| <a name="input_custom_logs_http_config_file_system_retention"></a> [custom\_logs\_http\_config\_file\_system\_retention](#input\_custom\_logs\_http\_config\_file\_system\_retention) | Définis la durée de rétention des logs http | `number` | `null` | no |
| <a name="input_custom_logs_http_config_file_system_retention_mb"></a> [custom\_logs\_http\_config\_file\_system\_retention\_mb](#input\_custom\_logs\_http\_config\_file\_system\_retention\_mb) | Définis la taille maximale de rétention des logs http | `number` | `null` | no |
| <a name="input_docker_image_name"></a> [docker\_image\_name](#input\_docker\_image\_name) | Nom complet de l'image Docker (repo:tag) | `string` | `null` | no |
| <a name="input_docker_registry_server_url"></a> [docker\_registry\_server\_url](#input\_docker\_registry\_server\_url) | URL du Container Registry (ex: https://xxx.azurecr.io) | `string` | `null` | no |
| <a name="input_dotnet_version"></a> [dotnet\_version](#input\_dotnet\_version) | Version de dotnet installé | `string` | `null` | no |
| <a name="input_enable_Microsoft_auth"></a> [enable\_Microsoft\_auth](#input\_enable\_Microsoft\_auth) | Active ou non l'authentification Microsoft | `bool` | `false` | no |
| <a name="input_enable_logs_analytics"></a> [enable\_logs\_analytics](#input\_enable\_logs\_analytics) | Activer ou non les log analytics (permet une meilleurs analyse des évènements) | `bool` | `false` | no |
| <a name="input_http2_enabled"></a> [http2\_enabled](#input\_http2\_enabled) | Should the HTTP2 be enabled? | `bool` | `true` | no |
| <a name="input_https_only"></a> [https\_only](#input\_https\_only) | Should the Linux Web App require HTTPS connections. | `bool` | `true` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | Type identité à activer sur la ressource ('UserAssigned' et 'SystemAssigned' sont les eules valeurs autorisées) | `string` | `"SystemAssigned"` | no |
| <a name="input_ip_restriction_default_action"></a> [ip\_restriction\_default\_action](#input\_ip\_restriction\_default\_action) | The Default action for traffic that does not match any ip\_restriction rule. possible values include Allow and Deny | `string` | `"Allow"` | no |
| <a name="input_is_webapp_python"></a> [is\_webapp\_python](#input\_is\_webapp\_python) | Specifies whether this is a Python app | `bool` | `false` | no |
| <a name="input_java_server"></a> [java\_server](#input\_java\_server) | type de serveur java installé | `string` | `null` | no |
| <a name="input_java_server_version"></a> [java\_server\_version](#input\_java\_server\_version) | Version du serveur java installé | `string` | `null` | no |
| <a name="input_java_version"></a> [java\_version](#input\_java\_version) | Version de java installé | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Localisation Azure | `string` | `"westeurope"` | no |
| <a name="input_map_storage_account"></a> [map\_storage\_account](#input\_map\_storage\_account) | Définis ou non si la webapp est mappée à un file share, attention si activée, les variables mount\_storage\_account\_name, mount\_storage\_account\_access\_key, mount\_name et mount\_share\_name deviennent obligatoires | `bool` | `false` | no |
| <a name="input_metric_category"></a> [metric\_category](#input\_metric\_category) | The name of a Diagnostic Metric Category for this Resource | `string` | `"AllMetrics"` | no |
| <a name="input_metric_enabled"></a> [metric\_enabled](#input\_metric\_enabled) | Is this Diagnostic Metric enabled? Defaults to true | `bool` | `false` | no |
| <a name="input_microsoft_v2_auth_secret"></a> [microsoft\_v2\_auth\_secret](#input\_microsoft\_v2\_auth\_secret) | Secret utilisé par la webapp pour s'authentifier avec le SPN qui fera la passerelle d'authentification entre la webapp et ENtra ID | `string` | `null` | no |
| <a name="input_microsoft_v2_client_id"></a> [microsoft\_v2\_client\_id](#input\_microsoft\_v2\_client\_id) | The OAuth 2.0 client ID that was created for the app used for authentication. | `string` | `null` | no |
| <a name="input_microsoft_v2_tenant_id"></a> [microsoft\_v2\_tenant\_id](#input\_microsoft\_v2\_tenant\_id) | Tenant ID utilisé en cas d'authentification MS activée | `string` | `"f30ac191-b8b4-45f2-9a9b-e5466cb90c2f"` | no |
| <a name="input_minimum_tls_version"></a> [minimum\_tls\_version](#input\_minimum\_tls\_version) | The configures the minimum version of TLS required for SSL requests. Possible values include: 1.0, 1.1, 1.2 and 1.3 | `string` | `"1.3"` | no |
| <a name="input_mount_name"></a> [mount\_name](#input\_mount\_name) | Nom du montage au niveau de la webapp | `string` | `null` | no |
| <a name="input_mount_share_name"></a> [mount\_share\_name](#input\_mount\_share\_name) | Nom du file share à monter | `string` | `null` | no |
| <a name="input_mount_storage_account_access_key"></a> [mount\_storage\_account\_access\_key](#input\_mount\_storage\_account\_access\_key) | access key du storage account à monter | `string` | `null` | no |
| <a name="input_mount_storage_account_name"></a> [mount\_storage\_account\_name](#input\_mount\_storage\_account\_name) | Nom du storage account à monter | `string` | `null` | no |
| <a name="input_node_version"></a> [node\_version](#input\_node\_version) | Version de node installé | `string` | `null` | no |
| <a name="input_php_version"></a> [php\_version](#input\_php\_version) | Version de php installé | `string` | `null` | no |
| <a name="input_private_endpoint_subnet_name"></a> [private\_endpoint\_subnet\_name](#input\_private\_endpoint\_subnet\_name) | Subnet ou sera déployé le private endpoint | `string` | `null` | no |
| <a name="input_private_endpoint_virtual_network_name"></a> [private\_endpoint\_virtual\_network\_name](#input\_private\_endpoint\_virtual\_network\_name) | VNET ou sera déployé le private endpoint | `string` | `null` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Autoriser l'accès public ? | `bool` | `false` | no |
| <a name="input_python_version"></a> [python\_version](#input\_python\_version) | Version de python installé | `string` | `null` | no |
| <a name="input_ruby_version"></a> [ruby\_version](#input\_ruby\_version) | Version de ruby installé | `string` | `null` | no |
| <a name="input_scm_ip_restriction_default_action"></a> [scm\_ip\_restriction\_default\_action](#input\_scm\_ip\_restriction\_default\_action) | he Default action for traffic that does not match any scm\_ip\_restriction rule. possible values include Allow and Deny | `string` | `"Allow"` | no |
| <a name="input_slot_custom_name"></a> [slot\_custom\_name](#input\_slot\_custom\_name) | Nom personnalisé du slot de la webapp | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Map de tags | `map(string)` | `{}` | no |
| <a name="input_user_assigned_identity_client_id"></a> [user\_assigned\_identity\_client\_id](#input\_user\_assigned\_identity\_client\_id) | Client ID de l'UAI | `string` | `null` | no |
| <a name="input_virtual_network_resource_group_name"></a> [virtual\_network\_resource\_group\_name](#input\_virtual\_network\_resource\_group\_name) | Nom du resource group du réseau virtuel (VNET) ou sera créé le private endpoint, obligatoire si le storage account a un private endpoint | `string` | `null` | no |
| <a name="input_virtual_network_subnet_id"></a> [virtual\_network\_subnet\_id](#input\_virtual\_network\_subnet\_id) | ID du subnet utilisé pour le VNET integration | `string` | `null` | no |
| <a name="input_workspace_id"></a> [workspace\_id](#input\_workspace\_id) | ID du Log Analytics Workspace | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_webapp_credentials"></a> [webapp\_credentials](#output\_webapp\_credentials) | Name and password of the default profile |
| <a name="output_webapp_id"></a> [webapp\_id](#output\_webapp\_id) | ID de la WebApp |
| <a name="output_webapp_name"></a> [webapp\_name](#output\_webapp\_name) | Nom de la WebApp |
<!-- END_TF_DOCS -->