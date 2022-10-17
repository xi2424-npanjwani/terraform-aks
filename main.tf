# PROVIDER CONFIGURATION

provider "azurerm" {
  features {
  }
}

# AKS MODULE

module "aks_cluster" {
  source                                  = "./module/terraform-azurerm-aks-6.1.0"
  prefix                                  = var.prefix
  resource_group_name                     = var.resource_group_name
  aci_connector_linux_enabled             = var.aci_connector_linux_enabled
  aci_connector_linux_subnet_name         = var.aci_connector_linux_subnet_name
  admin_username                          = var.admin_username
  agents_availability_zones               = var.agents_availability_zones
  agents_count                            = var.agents_count
  agents_labels                           = var.agents_labels
  agents_max_count                        = var.agents_max_count
  agents_max_pods                         = var.agents_max_pods
  agents_min_count                        = var.agents_min_count
  agents_pool_name                        = var.agents_pool_name
  agents_size                             = var.agents_size
  agents_tags                             = var.agents_tags
  agents_type                             = var.agents_type
  api_server_authorized_ip_ranges         = var.api_server_authorized_ip_ranges
  azure_policy_enabled                    = var.azure_policy_enabled
  client_id                               = var.client_id
  client_secret                           = var.client_secret
  cluster_log_analytics_workspace_name    = var.cluster_log_analytics_workspace_name
  cluster_name                            = var.cluster_name
  disk_encryption_set_id                  = var.disk_encryption_set_id
  enable_auto_scaling                     = var.enable_auto_scaling
  enable_host_encryption                  = var.enable_host_encryption
  enable_node_public_ip                   = var.enable_node_public_ip
  http_application_routing_enabled        = var.http_application_routing_enabled
  identity_type                           = var.identity_type
  ingress_application_gateway_enabled     = var.ingress_application_gateway_enabled
  ingress_application_gateway_id          = var.ingress_application_gateway_id
  ingress_application_gateway_name        = var.ingress_application_gateway_name
  ingress_application_gateway_subnet_cidr = var.ingress_application_gateway_subnet_cidr
  ingress_application_gateway_subnet_id   = var.ingress_application_gateway_subnet_id
  key_vault_secrets_provider_enabled      = var.key_vault_secrets_provider_enabled
  kubernetes_version                      = var.kubernetes_version
  local_account_disabled                  = var.local_account_disabled
  location                                = var.location
  # log_analytics_solution_id                   = var.log_analytics_solution_id
  # log_analytics_workspace_id                  = var.log_analytics_workspace_id
  log_analytics_workspace                     = var.log_analytics_workspace
  log_analytics_workspace_enabled             = var.log_analytics_workspace_enabled
  log_analytics_workspace_resource_group_name = var.log_analytics_workspace_resource_group_name
  log_analytics_workspace_sku                 = var.log_analytics_workspace_sku
  log_retention_in_days                       = var.log_retention_in_days
  microsoft_defender_enabled                  = var.microsoft_defender_enabled
  net_profile_dns_service_ip                  = var.net_profile_dns_service_ip
  net_profile_docker_bridge_cidr              = var.net_profile_docker_bridge_cidr
  net_profile_outbound_type                   = var.net_profile_outbound_type
  net_profile_pod_cidr                        = var.net_profile_pod_cidr
  net_profile_service_cidr                    = var.net_profile_service_cidr
  network_plugin                              = var.network_plugin
  network_policy                              = var.network_policy
  node_resource_group                         = var.node_resource_group
  oidc_issuer_enabled                         = var.oidc_issuer_enabled
  only_critical_addons_enabled                = var.only_critical_addons_enabled
  open_service_mesh_enabled                   = var.open_service_mesh_enabled
  orchestrator_version                        = var.orchestrator_version
  os_disk_size_gb                             = var.os_disk_size_gb
  os_disk_type                                = var.os_disk_type
  private_cluster_enabled                     = var.private_cluster_enabled
  private_cluster_public_fqdn_enabled         = var.private_cluster_public_fqdn_enabled
  private_dns_zone_id                         = var.private_dns_zone_id
  public_ssh_key                              = var.public_ssh_key
  rbac_aad_admin_group_object_ids             = var.rbac_aad_admin_group_object_ids
  rbac_aad_azure_rbac_enabled                 = var.rbac_aad_azure_rbac_enabled
  rbac_aad_client_app_id                      = var.rbac_aad_client_app_id
  rbac_aad_managed                            = var.rbac_aad_managed
  rbac_aad_server_app_id                      = var.rbac_aad_server_app_id
  rbac_aad_server_app_secret                  = var.rbac_aad_server_app_secret
  rbac_aad_tenant_id                          = var.rbac_aad_tenant_id
  role_based_access_control_enabled           = var.role_based_access_control_enabled
  secret_rotation_enabled                     = var.secret_rotation_enabled
  secret_rotation_interval                    = var.secret_rotation_interval
  sku_tier                                    = var.sku_tier
  tags                                        = var.tags
  vnet_subnet_id                              = var.vnet_subnet_id

}
