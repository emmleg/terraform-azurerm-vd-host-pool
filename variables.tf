variable "name" {
  description = "(Required) The name of the Virtual Desktop Host Pool. Changing this forces a new resource to be created."
  type        = string
}

variable "location" {
  description = "(Required) The location/region where the Virtual Desktop Host Pool is located. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the Virtual Desktop Host Pool. Changing this forces a new resource to be created."
  type        = string
}

variable "type" {
  description = "(Required) The type of the Virtual Desktop Host Pool. Valid options are Personal or Pooled. Changing the type forces a new resource to be created."
  type        = string
}

variable "load_balancer_type" {
  description = "(Required) BreadthFirst load balancing distributes new user sessions across all available session hosts in the host pool. Possible values are BreadthFirst, DepthFirst and Persistent. DepthFirst load balancing distributes new user sessions to an available session host with the highest number of connections but has not reached its maximum session limit threshold. Persistent should be used if the host pool type is Personal"
  type        = string
}

variable "friendly_name" {
  description = "(Optional) A friendly name for the Virtual Desktop Host Pool."
  type        = string
  default     = null
}

variable "description" {
  description = "(Optional) A description for the Virtual Desktop Host Pool."
  type        = string
  default     = null
}

variable "validate_environment" {
  description = "(Optional) Allows you to test service changes before they are deployed to production. Defaults to false."
  type        = bool
  default     = false
}

variable "start_vm_on_connect" {
  description = "(Optional) Enables or disables the Start VM on Connection Feature. Defaults to false."
  type        = bool
  default     = false
}

variable "custom_rdp_properties" {
  description = "(Optional) A valid custom RDP properties string for the Virtual Desktop Host Pool."
  type        = string
  default     = null
}

variable "personal_desktop_assignment_type" {
  description = "(Optional) Automatic assignment – The service will select an available host and assign it to an user. Possible values are Automatic and Direct. Direct Assignment – Admin selects a specific host to assign to an user. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "maximum_sessions_allowed" {
  description = "(Optional) A valid integer value from 0 to 999999 for the maximum number of users that have concurrent sessions on a session host. Should only be set if the type of your Virtual Desktop Host Pool is Pooled."
  type        = number
  default     = null
}

variable "preferred_app_group_type" {
  description = "(Optional) Option to specify the preferred Application Group type for the Virtual Desktop Host Pool. Valid options are None, Desktop or RailApplications. Default is Desktop. Changing this forces a new resource to be created."
  type        = string
  default     = "Desktop"
}

variable "scheduled_agent_updates" {
  description = "(Optional) A scheduled_agent_updates block as defined below. This enables control of when Agent Updates will be applied to Session Hosts."
  type = object({
    enabled                   = optional(bool)
    timezone                  = optional(string)
    use_session_host_timezone = optional(bool)
    schedule = optional(list(object({
      day_of_week = string
      hour_of_day = number
    })))
  })
  default = null
}

variable "registration_token_lifetime" {
  description = "(Optional) The life time of the registration token for the Host Pool in days. Default to 1 day."
  type        = number
  default     = 1
}

variable "enable_module_tags" {
  description = "(Optional) Enable or not built-in mapping of tags which should be assigned to the Host Pool. Default to 'true'."
  type        = bool
  default     = true
}

variable "tags" {
  description = "(Optional) A mapping of tags which should be assigned to the Host Pool."
  type        = map(string)
  default     = {}
}
