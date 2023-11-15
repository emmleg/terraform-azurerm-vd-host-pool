output "id" {
  value       = azurerm_virtual_desktop_host_pool.pool.id
  description = "The ID of the Virtual Desktop Host Pool."
}

output "name" {
  value       = azurerm_virtual_desktop_host_pool.pool.name
  description = "The Name of the Virtual Desktop Host Pool."
}

output "token" {
  value       = azurerm_virtual_desktop_host_pool_registration_info.registration.token
  description = "The registration token generated by the Virtual Desktop Host Pool for registration of session hosts."
  sensitive   = true
}