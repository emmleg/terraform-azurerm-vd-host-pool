<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_time"></a> [time](#provider\_time) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_desktop_host_pool.pool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_desktop_host_pool) | resource |
| [azurerm_virtual_desktop_host_pool_registration_info.registration](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_desktop_host_pool_registration_info) | resource |
| [time_rotating.token_registration_expiration](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/rotating) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_custom_rdp_properties"></a> [custom\_rdp\_properties](#input\_custom\_rdp\_properties) | (Optional) A valid custom RDP properties string for the Virtual Desktop Host Pool. | `string` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | (Optional) A description for the Virtual Desktop Host Pool. | `string` | `null` | no |
| <a name="input_enable_module_tags"></a> [enable\_module\_tags](#input\_enable\_module\_tags) | (Optional) Enable or not built-in mapping of tags which should be assigned to the Host Pool. Default to 'true'. | `bool` | `true` | no |
| <a name="input_friendly_name"></a> [friendly\_name](#input\_friendly\_name) | (Optional) A friendly name for the Virtual Desktop Host Pool. | `string` | `null` | no |
| <a name="input_load_balancer_type"></a> [load\_balancer\_type](#input\_load\_balancer\_type) | (Required) BreadthFirst load balancing distributes new user sessions across all available session hosts in the host pool. Possible values are BreadthFirst, DepthFirst and Persistent. DepthFirst load balancing distributes new user sessions to an available session host with the highest number of connections but has not reached its maximum session limit threshold. Persistent should be used if the host pool type is Personal | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | (Required) The location/region where the Virtual Desktop Host Pool is located. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_maximum_sessions_allowed"></a> [maximum\_sessions\_allowed](#input\_maximum\_sessions\_allowed) | (Optional) A valid integer value from 0 to 999999 for the maximum number of users that have concurrent sessions on a session host. Should only be set if the type of your Virtual Desktop Host Pool is Pooled. | `number` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the Virtual Desktop Host Pool. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_personal_desktop_assignment_type"></a> [personal\_desktop\_assignment\_type](#input\_personal\_desktop\_assignment\_type) | (Optional) Automatic assignment – The service will select an available host and assign it to an user. Possible values are Automatic and Direct. Direct Assignment – Admin selects a specific host to assign to an user. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_preferred_app_group_type"></a> [preferred\_app\_group\_type](#input\_preferred\_app\_group\_type) | (Optional) Option to specify the preferred Application Group type for the Virtual Desktop Host Pool. Valid options are None, Desktop or RailApplications. Default is Desktop. Changing this forces a new resource to be created. | `string` | `"Desktop"` | no |
| <a name="input_registration_token_lifetime"></a> [registration\_token\_lifetime](#input\_registration\_token\_lifetime) | (Optional) The life time of the registration token for the Host Pool in days. Default to 1 day. | `number` | `1` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group in which to create the Virtual Desktop Host Pool. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_scheduled_agent_updates"></a> [scheduled\_agent\_updates](#input\_scheduled\_agent\_updates) | (Optional) A scheduled\_agent\_updates block as defined below. This enables control of when Agent Updates will be applied to Session Hosts. | <pre>object({<br>    enabled                   = optional(bool)<br>    timezone                  = optional(string)<br>    use_session_host_timezone = optional(bool)<br>    schedule = optional(list(object({<br>      day_of_week = string<br>      hour_of_day = number<br>    })))<br>  })</pre> | `null` | no |
| <a name="input_start_vm_on_connect"></a> [start\_vm\_on\_connect](#input\_start\_vm\_on\_connect) | (Optional) Enables or disables the Start VM on Connection Feature. Defaults to false. | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags which should be assigned to the Host Pool. | `map(string)` | `{}` | no |
| <a name="input_type"></a> [type](#input\_type) | (Required) The type of the Virtual Desktop Host Pool. Valid options are Personal or Pooled. Changing the type forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_validate_environment"></a> [validate\_environment](#input\_validate\_environment) | (Optional) Allows you to test service changes before they are deployed to production. Defaults to false. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Virtual Desktop Host Pool. |
| <a name="output_name"></a> [name](#output\_name) | The Name of the Virtual Desktop Host Pool. |
| <a name="output_token"></a> [token](#output\_token) | The registration token generated by the Virtual Desktop Host Pool for registration of session hosts. |
<!-- END_TF_DOCS -->