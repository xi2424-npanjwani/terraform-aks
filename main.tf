provider "azurerm" {
  features {
  }
}

data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

locals {
  common_tags = var.common_tags
}

resource "azurerm_kubernetes_cluster" "main" {
  location                            = coalesce(var.location, data.azurerm_resource_group.main.location)
  name                                = var.cluster_name
  resource_group_name                 = data.azurerm_resource_group.main.name
  api_server_authorized_ip_ranges     = var.api_server_authorized_ip_ranges
  azure_policy_enabled                = var.azure_policy_enabled
  disk_encryption_set_id              = var.disk_encryption_set_id
  dns_prefix                          = var.cluster_name
  http_application_routing_enabled    = var.http_application_routing_enabled
  kubernetes_version                  = var.kubernetes_version
  local_account_disabled              = var.local_account_disabled
  node_resource_group                 = var.node_resource_group
  oidc_issuer_enabled                 = var.oidc_issuer_enabled
  open_service_mesh_enabled           = var.open_service_mesh_enabled
  private_cluster_enabled             = var.private_cluster_enabled
  private_cluster_public_fqdn_enabled = var.private_cluster_public_fqdn_enabled
  private_dns_zone_id                 = var.private_dns_zone_id
  role_based_access_control_enabled   = var.role_based_access_control_enabled
  sku_tier                            = var.sku_tier
  tags                                = merge(var.tags, local.common_tags)

  dynamic "default_node_pool" {
    for_each = var.enable_auto_scaling == true ? [] : ["default_node_pool_manually_scaled"]

    content {
      name                         = var.agents_pool_name
      vm_size                      = var.agents_size
      enable_auto_scaling          = var.enable_auto_scaling
      enable_host_encryption       = var.enable_host_encryption
      enable_node_public_ip        = var.enable_node_public_ip
      max_count                    = null
      max_pods                     = var.agents_max_pods
      min_count                    = null
      node_count                   = var.agents_count
      node_labels                  = var.agents_labels
      only_critical_addons_enabled = var.only_critical_addons_enabled
      os_disk_size_gb              = var.os_disk_size_gb
      os_disk_type                 = var.os_disk_type
      tags                         = merge(var.tags, var.agents_tags)
      type                         = var.agents_type
      vnet_subnet_id               = var.vnet_subnet_id
      zones                        = var.agents_availability_zones
    }
  }

  dynamic "default_node_pool" {
    for_each = var.enable_auto_scaling == true ? ["default_node_pool_auto_scaled"] : []

    content {
      name                         = var.agents_pool_name
      vm_size                      = var.agents_size
      enable_auto_scaling          = var.enable_auto_scaling
      enable_host_encryption       = var.enable_host_encryption
      enable_node_public_ip        = var.enable_node_public_ip
      max_count                    = var.agents_max_count
      max_pods                     = var.agents_max_pods
      min_count                    = var.agents_min_count
      node_labels                  = var.agents_labels
      only_critical_addons_enabled = var.only_critical_addons_enabled
      os_disk_size_gb              = var.os_disk_size_gb
      os_disk_type                 = var.os_disk_type
      tags                         = merge(var.tags, var.agents_tags)
      type                         = var.agents_type
      vnet_subnet_id               = var.vnet_subnet_id
      zones                        = var.agents_availability_zones
    }
  }

  dynamic "aci_connector_linux" {
    for_each = var.aci_connector_linux_enabled ? ["aci_connector_linux"] : []

    content {
      subnet_name = var.aci_connector_linux_subnet_name
    }
  }


  dynamic "azure_active_directory_role_based_access_control" {
    for_each = var.role_based_access_control_enabled && var.rbac_aad_managed ? ["rbac"] : []

    content {
      admin_group_object_ids = var.rbac_aad_admin_group_object_ids
      azure_rbac_enabled     = var.rbac_aad_azure_rbac_enabled
      managed                = true
      tenant_id              = var.rbac_aad_tenant_id
    }
  }


  dynamic "azure_active_directory_role_based_access_control" {
    for_each = var.role_based_access_control_enabled && !var.rbac_aad_managed ? ["rbac"] : []

    content {
      client_app_id     = var.rbac_aad_client_app_id
      managed           = false
      server_app_id     = var.rbac_aad_server_app_id
      server_app_secret = var.rbac_aad_server_app_secret
      tenant_id         = var.rbac_aad_tenant_id
    }
  }


  dynamic "identity" {
    for_each = var.client_id == "" || var.client_secret == "" ? ["identity"] : []

    content {
      type         = var.identity_type
      identity_ids = var.identity_ids
    }
  }

  dynamic "ingress_application_gateway" {
    for_each = var.ingress_application_gateway_enabled ? ["ingress_application_gateway"] : []

    content {
      gateway_id   = var.ingress_application_gateway_id
      gateway_name = var.ingress_application_gateway_name
      subnet_cidr  = var.ingress_application_gateway_subnet_cidr
      subnet_id    = var.ingress_application_gateway_subnet_id
    }
  }

  dynamic "key_vault_secrets_provider" {
    for_each = var.key_vault_secrets_provider_enabled ? ["key_vault_secrets_provider"] : []

    content {
      secret_rotation_enabled  = var.secret_rotation_enabled
      secret_rotation_interval = var.secret_rotation_interval
    }
  }


  dynamic "linux_profile" {
    for_each = var.admin_username == null ? [] : ["linux_profile"]

    content {
      admin_username = var.admin_username
      ssh_key {
        key_data = file(var.public_ssh_key)
      }
    }
  }


  dynamic "microsoft_defender" {
    for_each = var.microsoft_defender_enabled ? ["microsoft_defender"] : []

    content {
      log_analytics_workspace_id = coalesce(try(var.log_analytics_workspace.id, null), azurerm_log_analytics_workspace.main[0].id)
    }
  }


  network_profile {
    network_plugin     = var.network_plugin
    dns_service_ip     = var.net_profile_dns_service_ip
    docker_bridge_cidr = var.net_profile_docker_bridge_cidr
    network_policy     = var.network_policy
    outbound_type      = var.net_profile_outbound_type
    pod_cidr           = var.net_profile_pod_cidr
    service_cidr       = var.net_profile_service_cidr
  }


  dynamic "oms_agent" {
    for_each = var.log_analytics_workspace_enabled ? ["oms_agent"] : []

    content {
      log_analytics_workspace_id = var.log_analytics_workspace == null ? azurerm_log_analytics_workspace.main[0].id : var.log_analytics_workspace.id
    }
  }


  dynamic "service_principal" {
    for_each = var.client_id != "" && var.client_secret != "" ? ["service_principal"] : []

    content {
      client_id     = var.client_id
      client_secret = var.client_secret
    }
  }

  lifecycle {
    precondition {
      condition     = (var.client_id != "" && var.client_secret != "") || (var.identity_type != "")
      error_message = "Either `client_id` and `client_secret` or `identity_type` must be set."
    }
    precondition {
      # Why don't use var.identity_ids != null && length(var.identity_ids)>0 ? Because bool expression in Terraform is not short circuit so even var.identity_ids is null Terraform will still invoke length function with null and cause error. https://github.com/hashicorp/terraform/issues/24128
      condition     = (var.client_id != "" && var.client_secret != "") || (var.identity_type == "SystemAssigned") || (var.identity_ids == null ? false : length(var.identity_ids) > 0)
      error_message = "If use identity and `UserAssigned` or `SystemAssigned, UserAssigned` is set, an `identity_ids` must be set as well."
    }
  }

}

resource "azurerm_kubernetes_cluster_node_pool" "additional_node_pool" {

  count = length(var.additional_node_groups)

  enable_auto_scaling    = var.additional_node_groups[count.index].enable_auto_scaling
  name                   = var.additional_node_groups[count.index].name
  kubernetes_cluster_id  = azurerm_kubernetes_cluster.main.id
  vm_size                = var.additional_node_groups[count.index].vm_size
  enable_node_public_ip  = var.additional_node_groups[count.index].enable_node_public_ip
  node_count             = var.additional_node_groups[count.index].node_count
  max_count              = var.additional_node_groups[count.index].max_count
  min_count              = var.additional_node_groups[count.index].min_count
  enable_host_encryption = var.additional_node_groups[count.index].enable_host_encryption
  vnet_subnet_id         = var.vnet_subnet_id
  zones                  = var.agents_availability_zones
  priority               = var.additional_node_groups[count.index].priority
  os_type                = var.additional_node_groups[count.index].os_type
  os_sku                 = var.additional_node_groups[count.index].os_sku
  max_pods               = var.additional_node_groups[count.index].max_pods
  node_labels            = var.additional_node_groups[count.index].node_labels
  os_disk_size_gb        = var.additional_node_groups[count.index].os_disk_size_gb
  os_disk_type           = var.additional_node_groups[count.index].os_disk_type
  node_taints            = var.additional_node_groups[count.index].node_taints
}

resource "azurerm_log_analytics_workspace" "main" {
  count = var.log_analytics_workspace_enabled && var.log_analytics_workspace == null ? 1 : 0

  location            = coalesce(var.location, data.azurerm_resource_group.main.location)
  name                = var.cluster_log_analytics_workspace_name == null ? "${var.cluster_name}-workspace" : var.cluster_log_analytics_workspace_name
  resource_group_name = coalesce(var.log_analytics_workspace_resource_group_name, var.resource_group_name)
  retention_in_days   = var.log_retention_in_days
  sku                 = var.log_analytics_workspace_sku
  tags                = merge(var.workspace_tags, local.common_tags)
}

resource "azurerm_log_analytics_solution" "main" {
  count = var.log_analytics_workspace_enabled && var.log_analytics_solution_id == null ? 1 : 0

  location              = coalesce(var.location, data.azurerm_resource_group.main.location)
  resource_group_name   = coalesce(var.log_analytics_workspace_resource_group_name, var.resource_group_name)
  solution_name         = var.solution_name
  workspace_name        = var.log_analytics_workspace != null ? var.log_analytics_workspace.name : azurerm_log_analytics_workspace.main[0].name
  workspace_resource_id = var.log_analytics_workspace != null ? var.log_analytics_workspace.id : azurerm_log_analytics_workspace.main[0].id
  tags                  = merge(var.solution_tags, local.common_tags)

  plan {
    product   = var.plan_product
    publisher = var.plan_publisher
  }
}

