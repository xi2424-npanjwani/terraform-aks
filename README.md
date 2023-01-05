<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.11, < 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.37.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |
| [azurerm_kubernetes_cluster_node_pool.additional_node_pool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool) | resource |
| [azurerm_log_analytics_solution.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_solution) | resource |
| [azurerm_log_analytics_workspace.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |
| [azurerm_resource_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aci_connector_linux_enabled"></a> [aci\_connector\_linux\_enabled](#input\_aci\_connector\_linux\_enabled) | Enable Virtual Node pool | `bool` | `false` | no |
| <a name="input_aci_connector_linux_subnet_name"></a> [aci\_connector\_linux\_subnet\_name](#input\_aci\_connector\_linux\_subnet\_name) | (Optional) aci\_connector\_linux subnet name | `string` | `null` | no |
| <a name="input_additional_node_groups"></a> [additional\_node\_groups](#input\_additional\_node\_groups) | Map of AKS node group definitions to create | <pre>list(object({<br>    name                   = string<br>    vm_size                = string<br>    node_count             = number<br>    enable_host_encryption = bool<br>    enable_node_public_ip  = bool<br>    node_labels            = map(string)<br>    os_type                = string<br>    os_sku                 = string<br>    enable_auto_scaling    = bool<br>    max_count              = number<br>    min_count              = number<br>    os_disk_type           = string<br>    os_disk_size_gb        = number<br>    max_pods               = number<br>    node_taints            = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | The username of the local administrator to be created on the Kubernetes cluster. Set this variable to `null` to turn off the cluster's `linux_profile`. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_agents_availability_zones"></a> [agents\_availability\_zones](#input\_agents\_availability\_zones) | (Optional) A list of Availability Zones across which the Node Pool should be spread. Changing this forces a new resource to be created. | `list(string)` | <pre>[<br>  1,<br>  2<br>]</pre> | no |
| <a name="input_agents_count"></a> [agents\_count](#input\_agents\_count) | The number of Agents that should exist in the Agent Pool. Please set `agents_count` `null` while `enable_auto_scaling` is `true` to avoid possible `agents_count` changes. | `number` | `1` | no |
| <a name="input_agents_labels"></a> [agents\_labels](#input\_agents\_labels) | (Optional) A map of Kubernetes labels which should be applied to nodes in the Default Node Pool. Changing this forces a new resource to be created. | `map(string)` | `{}` | no |
| <a name="input_agents_max_count"></a> [agents\_max\_count](#input\_agents\_max\_count) | Maximum number of nodes in a pool | `number` | `5` | no |
| <a name="input_agents_max_pods"></a> [agents\_max\_pods](#input\_agents\_max\_pods) | (Optional) The maximum number of pods that can run on each agent. Changing this forces a new resource to be created. | `number` | `110` | no |
| <a name="input_agents_min_count"></a> [agents\_min\_count](#input\_agents\_min\_count) | Minimum number of nodes in a pool | `number` | `1` | no |
| <a name="input_agents_pool_name"></a> [agents\_pool\_name](#input\_agents\_pool\_name) | The default Azure AKS agentpool (nodepool) name. | `string` | `"nodepool"` | no |
| <a name="input_agents_size"></a> [agents\_size](#input\_agents\_size) | The default virtual machine size for the Kubernetes agents | `string` | `"Standard_DS2_v2"` | no |
| <a name="input_agents_tags"></a> [agents\_tags](#input\_agents\_tags) | (Optional) A mapping of tags to assign to the Node Pool. | `map(string)` | `{}` | no |
| <a name="input_agents_type"></a> [agents\_type](#input\_agents\_type) | (Optional) The type of Node Pool which should be created. Possible values are AvailabilitySet and VirtualMachineScaleSets. Defaults to VirtualMachineScaleSets. | `string` | `"VirtualMachineScaleSets"` | no |
| <a name="input_api_server_authorized_ip_ranges"></a> [api\_server\_authorized\_ip\_ranges](#input\_api\_server\_authorized\_ip\_ranges) | (Optional) The IP ranges to allow for incoming traffic to the server nodes. | `set(string)` | `null` | no |
| <a name="input_azure_policy_enabled"></a> [azure\_policy\_enabled](#input\_azure\_policy\_enabled) | Enable Azure Policy Addon. | `bool` | `false` | no |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | (Optional) The Client ID (appId) for the Service Principal used for the AKS deployment | `string` | `""` | no |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | (Optional) The Client Secret (password) for the Service Principal used for the AKS deployment | `string` | `""` | no |
| <a name="input_cluster_log_analytics_workspace_name"></a> [cluster\_log\_analytics\_workspace\_name](#input\_cluster\_log\_analytics\_workspace\_name) | (Optional) The name of the Analytics workspace | `string` | `null` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | (Optional) The name for the AKS resources created in the specified Azure Resource Group. This variable overwrites the 'prefix' var (The 'prefix' var will still be applied to the dns\_prefix if it is set) | `string` | `"aks_cluster"` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common Tags for every resource being created | `map(string)` | `{}` | no |
| <a name="input_disk_encryption_set_id"></a> [disk\_encryption\_set\_id](#input\_disk\_encryption\_set\_id) | (Optional) The ID of the Disk Encryption Set which should be used for the Nodes and Volumes. More information [can be found in the documentation](https://docs.microsoft.com/azure/aks/azure-disk-customer-managed-keys). Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_enable_auto_scaling"></a> [enable\_auto\_scaling](#input\_enable\_auto\_scaling) | Enable node pool autoscaling | `bool` | `true` | no |
| <a name="input_enable_host_encryption"></a> [enable\_host\_encryption](#input\_enable\_host\_encryption) | Enable Host Encryption for default node pool. Encryption at host feature must be enabled on the subscription: https://docs.microsoft.com/azure/virtual-machines/linux/disks-enable-host-based-encryption-cli | `bool` | `true` | no |
| <a name="input_enable_node_public_ip"></a> [enable\_node\_public\_ip](#input\_enable\_node\_public\_ip) | (Optional) Should nodes in this Node Pool have a Public IP Address? Defaults to false. | `bool` | `false` | no |
| <a name="input_http_application_routing_enabled"></a> [http\_application\_routing\_enabled](#input\_http\_application\_routing\_enabled) | Enable HTTP Application Routing Addon (forces recreation). | `bool` | `false` | no |
| <a name="input_identity_ids"></a> [identity\_ids](#input\_identity\_ids) | (Optional) Specifies a list of User Assigned Managed Identity IDs to be assigned to this Kubernetes Cluster. | `list(string)` | `null` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | (Optional) The type of identity used for the managed cluster. Conflict with `client_id` and `client_secret`. Possible values are `SystemAssigned`, `UserAssigned`, `SystemAssigned, UserAssigned`(to enable both). If `UserAssigned` or `SystemAssigned, UserAssigned` is set, an `identity_ids` must be set as well. | `string` | `"SystemAssigned"` | no |
| <a name="input_ingress_application_gateway_enabled"></a> [ingress\_application\_gateway\_enabled](#input\_ingress\_application\_gateway\_enabled) | Whether to deploy the Application Gateway ingress controller to this Kubernetes Cluster? | `bool` | `false` | no |
| <a name="input_ingress_application_gateway_id"></a> [ingress\_application\_gateway\_id](#input\_ingress\_application\_gateway\_id) | The ID of the Application Gateway to integrate with the ingress controller of this Kubernetes Cluster. | `string` | `null` | no |
| <a name="input_ingress_application_gateway_name"></a> [ingress\_application\_gateway\_name](#input\_ingress\_application\_gateway\_name) | The name of the Application Gateway to be used or created in the Nodepool Resource Group, which in turn will be integrated with the ingress controller of this Kubernetes Cluster. | `string` | `null` | no |
| <a name="input_ingress_application_gateway_subnet_cidr"></a> [ingress\_application\_gateway\_subnet\_cidr](#input\_ingress\_application\_gateway\_subnet\_cidr) | The subnet CIDR to be used to create an Application Gateway, which in turn will be integrated with the ingress controller of this Kubernetes Cluster. | `string` | `null` | no |
| <a name="input_ingress_application_gateway_subnet_id"></a> [ingress\_application\_gateway\_subnet\_id](#input\_ingress\_application\_gateway\_subnet\_id) | The ID of the subnet on which to create an Application Gateway, which in turn will be integrated with the ingress controller of this Kubernetes Cluster. | `string` | `null` | no |
| <a name="input_key_vault_secrets_provider_enabled"></a> [key\_vault\_secrets\_provider\_enabled](#input\_key\_vault\_secrets\_provider\_enabled) | (Optional) Whether to use the Azure Key Vault Provider for Secrets Store CSI Driver in an AKS cluster. For more details: https://docs.microsoft.com/en-us/azure/aks/csi-secrets-store-driver | `bool` | `true` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | Specify which Kubernetes release to use. The default used is the latest Kubernetes version available in the region | `string` | `"1.24"` | no |
| <a name="input_local_account_disabled"></a> [local\_account\_disabled](#input\_local\_account\_disabled) | (Optional) - If `true` local accounts will be disabled. Defaults to `false`. See [the documentation](https://docs.microsoft.com/azure/aks/managed-aad#disable-local-accounts) for more information. | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | Location of cluster, if not defined it will be read from the resource-group | `string` | `null` | no |
| <a name="input_log_analytics_solution_id"></a> [log\_analytics\_solution\_id](#input\_log\_analytics\_solution\_id) | (Optional) Existing azurerm\_log\_analytics\_solution ID. Providing ID disables creation of azurerm\_log\_analytics\_solution. | `string` | `null` | no |
| <a name="input_log_analytics_workspace"></a> [log\_analytics\_workspace](#input\_log\_analytics\_workspace) | (Optional) Existing azurerm\_log\_analytics\_workspace to attach azurerm\_log\_analytics\_solution. Providing the config disables creation of azurerm\_log\_analytics\_workspace. | <pre>object({<br>    id   = string<br>    name = string<br>  })</pre> | `null` | no |
| <a name="input_log_analytics_workspace_enabled"></a> [log\_analytics\_workspace\_enabled](#input\_log\_analytics\_workspace\_enabled) | Enable the integration of azurerm\_log\_analytics\_workspace and azurerm\_log\_analytics\_solution: https://docs.microsoft.com/en-us/azure/azure-monitor/containers/container-insights-onboard | `bool` | `true` | no |
| <a name="input_log_analytics_workspace_resource_group_name"></a> [log\_analytics\_workspace\_resource\_group\_name](#input\_log\_analytics\_workspace\_resource\_group\_name) | (Optional) Resource group name to create azurerm\_log\_analytics\_solution. | `string` | `null` | no |
| <a name="input_log_analytics_workspace_sku"></a> [log\_analytics\_workspace\_sku](#input\_log\_analytics\_workspace\_sku) | The SKU (pricing level) of the Log Analytics workspace. For new subscriptions the SKU should be set to PerGB2018 | `string` | `"PerGB2018"` | no |
| <a name="input_log_retention_in_days"></a> [log\_retention\_in\_days](#input\_log\_retention\_in\_days) | The retention period for the logs in days | `number` | `30` | no |
| <a name="input_microsoft_defender_enabled"></a> [microsoft\_defender\_enabled](#input\_microsoft\_defender\_enabled) | (Optional) Is Microsoft Defender on the cluster enabled? | `bool` | `false` | no |
| <a name="input_net_profile_dns_service_ip"></a> [net\_profile\_dns\_service\_ip](#input\_net\_profile\_dns\_service\_ip) | (Optional) IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns). Changing this forces a new resource to be created. | `string` | `"172.16.0.10"` | no |
| <a name="input_net_profile_docker_bridge_cidr"></a> [net\_profile\_docker\_bridge\_cidr](#input\_net\_profile\_docker\_bridge\_cidr) | (Optional) IP address (in CIDR notation) used as the Docker bridge IP address on nodes. Changing this forces a new resource to be created. | `string` | `"172.16.4.1/22"` | no |
| <a name="input_net_profile_outbound_type"></a> [net\_profile\_outbound\_type](#input\_net\_profile\_outbound\_type) | (Optional) The outbound (egress) routing method which should be used for this Kubernetes Cluster. Possible values are loadBalancer and userDefinedRouting. Defaults to loadBalancer. | `string` | `"loadBalancer"` | no |
| <a name="input_net_profile_pod_cidr"></a> [net\_profile\_pod\_cidr](#input\_net\_profile\_pod\_cidr) | (Optional) The CIDR to use for pod IP addresses. This field can only be set when network\_plugin is set to kubenet. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_net_profile_service_cidr"></a> [net\_profile\_service\_cidr](#input\_net\_profile\_service\_cidr) | (Optional) The Network Range used by the Kubernetes service. Changing this forces a new resource to be created. | `string` | `"172.16.0.0/22"` | no |
| <a name="input_network_plugin"></a> [network\_plugin](#input\_network\_plugin) | Network plugin to use for networking. | `string` | `"azure"` | no |
| <a name="input_network_policy"></a> [network\_policy](#input\_network\_policy) | (Optional) Sets up network policy to be used with Azure CNI. Network policy allows us to control the traffic flow between pods. Currently supported values are calico and azure. Changing this forces a new resource to be created. | `string` | `"calico"` | no |
| <a name="input_node_resource_group"></a> [node\_resource\_group](#input\_node\_resource\_group) | The generated Resource Group which contains the resources for this Managed Kubernetes Cluster. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_oidc_issuer_enabled"></a> [oidc\_issuer\_enabled](#input\_oidc\_issuer\_enabled) | Enable or Disable the OIDC issuer URL. Defaults to false. | `bool` | `false` | no |
| <a name="input_only_critical_addons_enabled"></a> [only\_critical\_addons\_enabled](#input\_only\_critical\_addons\_enabled) | (Optional) Enabling this option will taint default node pool with `CriticalAddonsOnly=true:NoSchedule` taint. Changing this forces a new resource to be created. | `bool` | `false` | no |
| <a name="input_open_service_mesh_enabled"></a> [open\_service\_mesh\_enabled](#input\_open\_service\_mesh\_enabled) | Is Open Service Mesh enabled? For more details, please visit [Open Service Mesh for AKS](https://docs.microsoft.com/azure/aks/open-service-mesh-about). | `bool` | `false` | no |
| <a name="input_os_disk_size_gb"></a> [os\_disk\_size\_gb](#input\_os\_disk\_size\_gb) | Disk size of nodes in GBs. | `number` | `50` | no |
| <a name="input_os_disk_type"></a> [os\_disk\_type](#input\_os\_disk\_type) | The type of disk which should be used for the Operating System. Possible values are `Ephemeral` and `Managed`. Defaults to `Managed`. Changing this forces a new resource to be created. | `string` | `"Managed"` | no |
| <a name="input_plan_product"></a> [plan\_product](#input\_plan\_product) | The product name of the solution. For example OMSGallery/Containers | `string` | `"OMSGallery/ContainerInsights"` | no |
| <a name="input_plan_publisher"></a> [plan\_publisher](#input\_plan\_publisher) | The publisher of the solution | `string` | `"Microsoft"` | no |
| <a name="input_private_cluster_enabled"></a> [private\_cluster\_enabled](#input\_private\_cluster\_enabled) | If true cluster API server will be exposed only on internal IP address and available only in cluster vnet. | `bool` | `true` | no |
| <a name="input_private_cluster_public_fqdn_enabled"></a> [private\_cluster\_public\_fqdn\_enabled](#input\_private\_cluster\_public\_fqdn\_enabled) | (Optional) Specifies whether a Public FQDN for this Private Cluster should be added. Defaults to `false`. | `bool` | `false` | no |
| <a name="input_private_dns_zone_id"></a> [private\_dns\_zone\_id](#input\_private\_dns\_zone\_id) | (Optional) Either the ID of Private DNS Zone which should be delegated to this Cluster, `System` to have AKS manage this or `None`. In case of `None` you will need to bring your own DNS server and set up resolving, otherwise cluster will have issues after provisioning. Changing this forces a new resource to be created. | `string` | `"System"` | no |
| <a name="input_public_ssh_key"></a> [public\_ssh\_key](#input\_public\_ssh\_key) | A custom ssh key to control access to the AKS cluster. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_rbac_aad_admin_group_object_ids"></a> [rbac\_aad\_admin\_group\_object\_ids](#input\_rbac\_aad\_admin\_group\_object\_ids) | Object ID of groups with admin access. | `list(string)` | `null` | no |
| <a name="input_rbac_aad_azure_rbac_enabled"></a> [rbac\_aad\_azure\_rbac\_enabled](#input\_rbac\_aad\_azure\_rbac\_enabled) | (Optional) Is Role Based Access Control based on Azure AD enabled? | `bool` | `true` | no |
| <a name="input_rbac_aad_client_app_id"></a> [rbac\_aad\_client\_app\_id](#input\_rbac\_aad\_client\_app\_id) | The Client ID of an Azure Active Directory Application. | `string` | `null` | no |
| <a name="input_rbac_aad_managed"></a> [rbac\_aad\_managed](#input\_rbac\_aad\_managed) | Is the Azure Active Directory integration Managed, meaning that Azure will create/manage the Service Principal used for integration. | `bool` | `true` | no |
| <a name="input_rbac_aad_server_app_id"></a> [rbac\_aad\_server\_app\_id](#input\_rbac\_aad\_server\_app\_id) | The Server ID of an Azure Active Directory Application. | `string` | `null` | no |
| <a name="input_rbac_aad_server_app_secret"></a> [rbac\_aad\_server\_app\_secret](#input\_rbac\_aad\_server\_app\_secret) | The Server Secret of an Azure Active Directory Application. | `string` | `null` | no |
| <a name="input_rbac_aad_tenant_id"></a> [rbac\_aad\_tenant\_id](#input\_rbac\_aad\_tenant\_id) | (Optional) The Tenant ID used for Azure Active Directory Application. If this isn't specified the Tenant ID of the current Subscription is used. | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The resource group name to be imported | `string` | n/a | yes |
| <a name="input_role_based_access_control_enabled"></a> [role\_based\_access\_control\_enabled](#input\_role\_based\_access\_control\_enabled) | Enable Role Based Access Control. | `bool` | `true` | no |
| <a name="input_secret_rotation_enabled"></a> [secret\_rotation\_enabled](#input\_secret\_rotation\_enabled) | Is secret rotation enabled? This variable is only used when `key_vault_secrets_provider_enabled` is `true` and defaults to `false` | `bool` | `true` | no |
| <a name="input_secret_rotation_interval"></a> [secret\_rotation\_interval](#input\_secret\_rotation\_interval) | The interval to poll for secret rotation. This attribute is only set when `secret_rotation` is `true` and defaults to `2m` | `string` | `"2m"` | no |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free and Paid | `string` | `"Free"` | no |
| <a name="input_solution_name"></a> [solution\_name](#input\_solution\_name) | The name of the log analytics solution created | `string` | `"ContainerInsights"` | no |
| <a name="input_solution_tags"></a> [solution\_tags](#input\_solution\_tags) | Any special tags that should be present on the solution resource | `map(string)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Any tags that should be present on the AKS cluster resources | `map(string)` | `{}` | no |
| <a name="input_vnet_subnet_id"></a> [vnet\_subnet\_id](#input\_vnet\_subnet\_id) | (Optional) The ID of a Subnet where the Kubernetes Node Pool should exist. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_workspace_tags"></a> [workspace\_tags](#input\_workspace\_tags) | Any special tags that should be present on the workspace resource | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aci_connector_linux"></a> [aci\_connector\_linux](#output\_aci\_connector\_linux) | The `aci_connector_linux` block of `azurerm_kubernetes_cluster` resource. |
| <a name="output_aci_connector_linux_enabled"></a> [aci\_connector\_linux\_enabled](#output\_aci\_connector\_linux\_enabled) | Has `aci_connector_linux` been enabled on the `azurerm_kubernetes_cluster` resource? |
| <a name="output_admin_client_certificate"></a> [admin\_client\_certificate](#output\_admin\_client\_certificate) | The `client_certificate` in the `azurerm_kubernetes_cluster`'s `kube_admin_config` block.  Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster. |
| <a name="output_admin_client_key"></a> [admin\_client\_key](#output\_admin\_client\_key) | The `client_key` in the `azurerm_kubernetes_cluster`'s `kube_admin_config` block. Base64 encoded private key used by clients to authenticate to the Kubernetes cluster. |
| <a name="output_admin_cluster_ca_certificate"></a> [admin\_cluster\_ca\_certificate](#output\_admin\_cluster\_ca\_certificate) | The `cluster_ca_certificate` in the `azurerm_kubernetes_cluster`'s `kube_admin_config` block. Base64 encoded public CA certificate used as the root of trust for the Kubernetes cluster. |
| <a name="output_admin_host"></a> [admin\_host](#output\_admin\_host) | The `host` in the `azurerm_kubernetes_cluster`'s `kube_admin_config` block. The Kubernetes cluster server host. |
| <a name="output_admin_password"></a> [admin\_password](#output\_admin\_password) | The `password` in the `azurerm_kubernetes_cluster`'s `kube_admin_config` block. A password or token used to authenticate to the Kubernetes cluster. |
| <a name="output_admin_username"></a> [admin\_username](#output\_admin\_username) | The `username` in the `azurerm_kubernetes_cluster`'s `kube_admin_config` block. A username used to authenticate to the Kubernetes cluster. |
| <a name="output_aks_id"></a> [aks\_id](#output\_aks\_id) | The `azurerm_kubernetes_cluster`'s id. |
| <a name="output_aks_name"></a> [aks\_name](#output\_aks\_name) | The `aurerm_kubernetes-cluster`'s name. |
| <a name="output_azure_policy_enabled"></a> [azure\_policy\_enabled](#output\_azure\_policy\_enabled) | The `azurerm_kubernetes_cluster`'s `azure_policy_enabled` argument. Should the Azure Policy Add-On be enabled? For more details please visit [Understand Azure Policy for Azure Kubernetes Service](https://docs.microsoft.com/en-ie/azure/governance/policy/concepts/rego-for-aks) |
| <a name="output_azurerm_log_analytics_workspace_id"></a> [azurerm\_log\_analytics\_workspace\_id](#output\_azurerm\_log\_analytics\_workspace\_id) | The id of the created Log Analytics workspace |
| <a name="output_azurerm_log_analytics_workspace_name"></a> [azurerm\_log\_analytics\_workspace\_name](#output\_azurerm\_log\_analytics\_workspace\_name) | The name of the created Log Analytics workspace |
| <a name="output_azurerm_log_analytics_workspace_primary_shared_key"></a> [azurerm\_log\_analytics\_workspace\_primary\_shared\_key](#output\_azurerm\_log\_analytics\_workspace\_primary\_shared\_key) | Specifies the workspace key of the log analytics workspace |
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | The `client_certificate` in the `azurerm_kubernetes_cluster`'s `kube_config` block. Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster. |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | The `client_key` in the `azurerm_kubernetes_cluster`'s `kube_config` block. Base64 encoded private key used by clients to authenticate to the Kubernetes cluster. |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | The `cluster_ca_certificate` in the `azurerm_kubernetes_cluster`'s `kube_config` block. Base64 encoded public CA certificate used as the root of trust for the Kubernetes cluster. |
| <a name="output_cluster_identity"></a> [cluster\_identity](#output\_cluster\_identity) | The `azurerm_kubernetes_cluster`'s `identity` block. |
| <a name="output_host"></a> [host](#output\_host) | The `host` in the `azurerm_kubernetes_cluster`'s `kube_config` block. The Kubernetes cluster server host. |
| <a name="output_http_application_routing_enabled"></a> [http\_application\_routing\_enabled](#output\_http\_application\_routing\_enabled) | The `azurerm_kubernetes_cluster`'s `http_application_routing_enabled` argument. (Optional) Should HTTP Application Routing be enabled? |
| <a name="output_http_application_routing_zone_name"></a> [http\_application\_routing\_zone\_name](#output\_http\_application\_routing\_zone\_name) | The `azurerm_kubernetes_cluster`'s `http_application_routing_zone_name` argument. The Zone Name of the HTTP Application Routing. |
| <a name="output_ingress_application_gateway"></a> [ingress\_application\_gateway](#output\_ingress\_application\_gateway) | The `azurerm_kubernetes_cluster`'s `ingress_application_gateway` block. |
| <a name="output_ingress_application_gateway_enabled"></a> [ingress\_application\_gateway\_enabled](#output\_ingress\_application\_gateway\_enabled) | Has the `azurerm_kubernetes_cluster` turned on `ingress_application_gateway` block? |
| <a name="output_key_vault_secrets_provider"></a> [key\_vault\_secrets\_provider](#output\_key\_vault\_secrets\_provider) | The `azurerm_kubernetes_cluster`'s `key_vault_secrets_provider` block. |
| <a name="output_key_vault_secrets_provider_enabled"></a> [key\_vault\_secrets\_provider\_enabled](#output\_key\_vault\_secrets\_provider\_enabled) | Has the `azurerm_kubernetes_cluster` turned on `key_vault_secrets_provider` block? |
| <a name="output_kube_admin_config_raw"></a> [kube\_admin\_config\_raw](#output\_kube\_admin\_config\_raw) | The `azurerm_kubernetes_cluster`'s `kube_admin_config_raw` argument. Raw Kubernetes config for the admin account to be used by [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/) and other compatible tools. This is only available when Role Based Access Control with Azure Active Directory is enabled and local accounts enabled. |
| <a name="output_kube_config_raw"></a> [kube\_config\_raw](#output\_kube\_config\_raw) | The `azurerm_kubernetes_cluster`'s `kube_config_raw` argument. Raw Kubernetes config to be used by [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/) and other compatible tools. |
| <a name="output_kubelet_identity"></a> [kubelet\_identity](#output\_kubelet\_identity) | The `azurerm_kubernetes_cluster`'s `kubelet_identity` block. |
| <a name="output_location"></a> [location](#output\_location) | The `azurerm_kubernetes_cluster`'s `location` argument. (Required) The location where the Managed Kubernetes Cluster should be created. |
| <a name="output_node_resource_group"></a> [node\_resource\_group](#output\_node\_resource\_group) | The auto-generated Resource Group which contains the resources for this Managed Kubernetes Cluster. |
| <a name="output_oidc_issuer_url"></a> [oidc\_issuer\_url](#output\_oidc\_issuer\_url) | The OIDC issuer URL that is associated with the cluster. |
| <a name="output_oms_agent"></a> [oms\_agent](#output\_oms\_agent) | The `azurerm_kubernetes_cluster`'s `oms_agent` argument. |
| <a name="output_oms_agent_enabled"></a> [oms\_agent\_enabled](#output\_oms\_agent\_enabled) | Has the `azurerm_kubernetes_cluster` turned on `oms_agent` block? |
| <a name="output_password"></a> [password](#output\_password) | The `password` in the `azurerm_kubernetes_cluster`'s `kube_config` block. A password or token used to authenticate to the Kubernetes cluster. |
| <a name="output_username"></a> [username](#output\_username) | The `username` in the `azurerm_kubernetes_cluster`'s `kube_config` block. A username used to authenticate to the Kubernetes cluster. |
<!-- END_TF_DOCS -->