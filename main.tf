resource "britive_advanced_settings" "advanced_settings" {
  for_each = var.advanced_settings

  resource_id   = each.value.resource_id
  resource_type = each.value.resource_type

  dynamic "im" {
    for_each = each.value.im != null ? each.value.im : []
    content {
      connection_id            = im.value.connection_id
      connection_type          = im.value.connection_type
      escalation_policies      = im.value.escalation_policies
      is_auto_approval_enabled = im.value.is_auto_approval_enabled
    }
  }

  dynamic "itsm" {
    for_each = each.value.itsm != null ? each.value.itsm : []
    content {
      connection_id   = itsm.value.connection_id
      connection_type = itsm.value.connection_type
      is_itsm_enabled = itsm.value.is_itsm_enabled
      dynamic "itsm_filter_criteria" {
        for_each = itsm.value.itsm_filter_criteria != null ? itsm.value.itsm_filter_criteria : []
        content {
          filter                = itsm_filter_criteria.value.filter
          supported_ticket_type = itsm_filter_criteria.value.supported_ticket_type
        }
      }
    }
  }

  dynamic "justification_settings" {
    for_each = each.value.justification_settings != null ? each.value.justification_settings : []
    content {
      is_justification_required = justification_settings.value.is_justification_required
      justification_regex       = justification_settings.value.justification_regex
    }
  }
}

