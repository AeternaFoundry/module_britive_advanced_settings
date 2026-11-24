output "advanced_settings_id" {
  description = "Map of id values across all advanced_settings, keyed the same as var.advanced_settings"
  value       = { for k, v in britive_advanced_settings.advanced_settings : k => v.id }
}
output "advanced_settings_im" {
  description = "Map of im values across all advanced_settings, keyed the same as var.advanced_settings"
  value       = { for k, v in britive_advanced_settings.advanced_settings : k => v.im }
}
output "advanced_settings_itsm" {
  description = "Map of itsm values across all advanced_settings, keyed the same as var.advanced_settings"
  value       = { for k, v in britive_advanced_settings.advanced_settings : k => v.itsm }
}
output "advanced_settings_justification_settings" {
  description = "Map of justification_settings values across all advanced_settings, keyed the same as var.advanced_settings"
  value       = { for k, v in britive_advanced_settings.advanced_settings : k => v.justification_settings }
}
output "advanced_settings_resource_id" {
  description = "Map of resource_id values across all advanced_settings, keyed the same as var.advanced_settings"
  value       = { for k, v in britive_advanced_settings.advanced_settings : k => v.resource_id }
}
output "advanced_settings_resource_type" {
  description = "Map of resource_type values across all advanced_settings, keyed the same as var.advanced_settings"
  value       = { for k, v in britive_advanced_settings.advanced_settings : k => v.resource_type }
}

