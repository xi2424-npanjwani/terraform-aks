# output "aci_connector_linux" {
#   description = "The `aci_connector_linux` block of `module` resource."
#   value       = try(module.aks_cluster.aci_connector_linux[0], null)
# }

# output "aci_connector_linux_enabled" {
#   description = "Has `aci_connector_linux` been enabled on the `module` resource?"
#   value       = can(module.aks_cluster.aci_connector_linux[0])
# }

# # output "admin_client_certificate" {
# #   description = "The `client_certificate` in the `module`'s `kube_admin_config` block.  Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster."
# #   sensitive   = true
# #   value       = try(module.aks_cluster.kube_admin_config[0].client_certificate, "")
# # }

# # output "admin_client_key" {
# #   description = "The `client_key` in the `module`'s `kube_admin_config` block. Base64 encoded private key used by clients to authenticate to the Kubernetes cluster."
# #   sensitive   = true
# #   value       = try(module.aks_cluster.kube_admin_config[0].client_key, "")
# # }

# # output "admin_cluster_ca_certificate" {
# #   description = "The `cluster_ca_certificate` in the `module`'s `kube_admin_config` block. Base64 encoded public CA certificate used as the root of trust for the Kubernetes cluster."
# #   sensitive   = true
# #   value       = try(module.aks_cluster.kube_admin_config[0].cluster_ca_certificate, "")
# # }

# # output "admin_host" {
# #   description = "The `host` in the `module`'s `kube_admin_config` block. The Kubernetes cluster server host."
# #   sensitive   = true
# #   value       = try(module.aks_cluster.kube_admin_config[0].host, "")
# # }

# # output "admin_password" {
# #   description = "The `password` in the `module`'s `kube_admin_config` block. A password or token used to authenticate to the Kubernetes cluster."
# #   sensitive   = true
# #   value       = try(module.aks_cluster.kube_admin_config[0].password, "")
# # }

# # output "admin_username" {
# #   description = "The `username` in the `module`'s `kube_admin_config` block. A username used to authenticate to the Kubernetes cluster."
# #   sensitive   = true
# #   value       = try(module.aks_cluster.kube_admin_config[0].username, "")
# # }

# output "aks_cluster_id" {
#   description = "The `module`'s id."
#   value       = module.aks_cluster.id
# }

# output "aks_cluster_name" {
#   description = "The `aurerm_kubernetes-cluster`'s name."
#   value       = module.aks_cluster.name
# }

# output "azure_policy_enabled" {
#   description = "The `module`'s `azure_policy_enabled` argument. Should the Azure Policy Add-On be enabled? For more details please visit [Understand Azure Policy for Azure Kubernetes Service](https://docs.microsoft.com/en-ie/azure/governance/policy/concepts/rego-for-aks_cluster)"
#   value       = module.aks_cluster.azure_policy_enabled
# }

# output "azurerm_log_analytics_workspace_id" {
#   description = "The id of the created Log Analytics workspace"
#   value       = try(azurerm_log_analytics_workspace.aks_cluster[0].id, null)
# }

# output "azurerm_log_analytics_workspace_name" {
#   description = "The name of the created Log Analytics workspace"
#   value       = try(azurerm_log_analytics_workspace.aks_cluster[0].name, null)
# }

# output "azurerm_log_analytics_workspace_primary_shared_key" {
#   description = "Specifies the workspace key of the log analytics workspace"
#   sensitive   = true
#   value       = try(azurerm_log_analytics_workspace.aks_cluster[0].primary_shared_key, null)
# }

# output "client_certificate" {
#   description = "The `client_certificate` in the `module`'s `kube_config` block. Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster."
#   sensitive   = true
#   value       = module.aks_cluster.kube_config[0].client_certificate
# }

# output "client_key" {
#   description = "The `client_key` in the `module`'s `kube_config` block. Base64 encoded private key used by clients to authenticate to the Kubernetes cluster."
#   sensitive   = true
#   value       = module.aks_cluster.kube_config[0].client_key
# }

# output "cluster_ca_certificate" {
#   description = "The `cluster_ca_certificate` in the `module`'s `kube_config` block. Base64 encoded public CA certificate used as the root of trust for the Kubernetes cluster."
#   sensitive   = true
#   value       = module.aks_cluster.kube_config[0].cluster_ca_certificate
# }

# output "cluster_identity" {
#   description = "The `module`'s `identity` block."
#   value       = try(module.aks_cluster.identity[0], null)
# }

# output "generated_cluster_private_ssh_key" {
#   description = "The cluster will use this generated private key as ssh key when `var.public_ssh_key` is empty or null. Private key data in [PEM (RFC 1421)](https://datatracker.ietf.org/doc/html/rfc1421) format."
#   sensitive   = true
#   value       = try(module.aks_cluster.linux_profile[0], null) != null ? (var.public_ssh_key == "" || var.public_ssh_key == null ? tls_private_key.ssh[0].private_key_pem : null) : null
# }

# output "generated_cluster_public_ssh_key" {
#   description = "The cluster will use this generated public key as ssh key when `var.public_ssh_key` is empty or null. The fingerprint of the public key data in OpenSSH MD5 hash format, e.g. `aa:bb:cc:....` Only available if the selected private key format is compatible, similarly to `public_key_openssh` and the [ECDSA P224 limitations](https://registry.terraform.io/providers/hashicorp/tls/latest/docs#limitations)."
#   value       = try(module.aks_cluster.linux_profile[0], null) != null ? (var.public_ssh_key == "" || var.public_ssh_key == null ? tls_private_key.ssh[0].public_key_openssh : null) : null
# }

# output "host" {
#   description = "The `host` in the `module`'s `kube_config` block. The Kubernetes cluster server host."
#   sensitive   = true
#   value       = module.aks_cluster.kube_config[0].host
# }

# output "http_application_routing_enabled" {
#   description = "The `module`'s `http_application_routing_enabled` argument. (Optional) Should HTTP Application Routing be enabled?"
#   value       = module.aks_cluster.http_application_routing_enabled
# }

# output "http_application_routing_zone_name" {
#   description = "The `module`'s `http_application_routing_zone_name` argument. The Zone Name of the HTTP Application Routing."
#   value       = module.aks_cluster.http_application_routing_zone_name != null ? module.aks_cluster.http_application_routing_zone_name : ""
# }

# output "ingress_application_gateway" {
#   description = "The `module`'s `ingress_application_gateway` block."
#   value       = try(module.aks_cluster.ingress_application_gateway[0], null)
# }

# output "ingress_application_gateway_enabled" {
#   description = "Has the `module` turned on `ingress_application_gateway` block?"
#   value       = can(module.aks_cluster.ingress_application_gateway[0])
# }

# output "key_vault_secrets_provider" {
#   description = "The `module`'s `key_vault_secrets_provider` block."
#   value       = try(module.aks_cluster.key_vault_secrets_provider[0], null)
# }

# output "key_vault_secrets_provider_enabled" {
#   description = "Has the `module` turned on `key_vault_secrets_provider` block?"
#   value       = can(module.aks_cluster.key_vault_secrets_provider[0])
# }

# output "kube_admin_config_raw" {
#   description = "The `module`'s `kube_admin_config_raw` argument. Raw Kubernetes config for the admin account to be used by [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/) and other compatible tools. This is only available when Role Based Access Control with Azure Active Directory is enabled and local accounts enabled."
#   sensitive   = true
#   value       = module.aks_cluster.kube_admin_config_raw
# }

# output "kube_config_raw" {
#   description = "The `module`'s `kube_config_raw` argument. Raw Kubernetes config to be used by [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/) and other compatible tools."
#   sensitive   = true
#   value       = module.aks_cluster.kube_config_raw
# }

# output "kubelet_identity" {
#   description = "The `module`'s `kubelet_identity` block."
#   value       = module.aks_cluster.kubelet_identity
# }

# output "location" {
#   description = "The `module`'s `location` argument. (Required) The location where the Managed Kubernetes Cluster should be created."
#   value       = module.aks_cluster.location
# }

# output "node_resource_group" {
#   description = "The auto-generated Resource Group which contains the resources for this Managed Kubernetes Cluster."
#   value       = module.aks_cluster.node_resource_group
# }

# output "oidc_issuer_url" {
#   description = "The OIDC issuer URL that is associated with the cluster."
#   value       = module.aks_cluster.oidc_issuer_url
# }

# output "oms_agent" {
#   description = "The `module`'s `oms_agent` argument."
#   value       = try(module.aks_cluster.oms_agent[0], null)
# }

# output "oms_agent_enabled" {
#   description = "Has the `module` turned on `oms_agent` block?"
#   value       = can(module.aks_cluster.oms_agent[0])
# }

# output "open_service_mesh_enabled" {
#   description = "(Optional) Is Open Service Mesh enabled? For more details, please visit [Open Service Mesh for aks_cluster](https://docs.microsoft.com/azure/aks_cluster/open-service-mesh-about)."
#   value       = module.aks_cluster.open_service_mesh_enabled
# }

# output "password" {
#   description = "The `password` in the `module`'s `kube_config` block. A password or token used to authenticate to the Kubernetes cluster."
#   sensitive   = true
#   value       = module.aks_cluster.kube_config[0].password
# }

# output "username" {
#   description = "The `username` in the `module`'s `kube_config` block. A username used to authenticate to the Kubernetes cluster."
#   sensitive   = true
#   value       = module.aks_cluster.kube_config[0].username
# }
