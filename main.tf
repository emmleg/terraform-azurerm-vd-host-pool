resource "azurerm_virtual_desktop_host_pool" "pool" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  type                = var.type
  load_balancer_type  = var.type == "Personal" ? "Persistent" : var.load_balancer_type

  friendly_name                    = var.friendly_name
  description                      = var.description
  validate_environment             = var.validate_environment
  start_vm_on_connect              = var.start_vm_on_connect
  custom_rdp_properties            = var.custom_rdp_properties
  personal_desktop_assignment_type = var.type == "Personal" ? try(var.personal_desktop_assignment_type, "Automatic") : null
  maximum_sessions_allowed         = var.type == "Pooled" ? var.maximum_sessions_allowed : null
  preferred_app_group_type         = var.preferred_app_group_type

  dynamic "scheduled_agent_updates" {
    for_each = var.scheduled_agent_updates != null ? [var.scheduled_agent_updates] : []
    content {
      enabled                   = scheduled_agent_updates.value.enabled
      timezone                  = scheduled_agent_updates.value.timezone
      use_session_host_timezone = scheduled_agent_updates.value.use_session_host_timezone

      dynamic "schedule" {
        for_each = scheduled_agent_updates.value.schedule
        content {
          day_of_week = schedule.value.day_of_week
          hour_of_day = schedule.value.hour_of_day
        }
      }
    }
  }

  tags = merge(local.module_tags, var.tags)
}

resource "time_rotating" "token_registration_expiration" {
  rotation_days = var.registration_token_lifetime
}

resource "azurerm_virtual_desktop_host_pool_registration_info" "registration" {
  hostpool_id     = azurerm_virtual_desktop_host_pool.pool.id
  expiration_date = time_rotating.token_registration_expiration.rotation_rfc3339
}
