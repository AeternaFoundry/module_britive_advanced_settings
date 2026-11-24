variable "advanced_settings" {
  description = <<EOT
Map of advanced_settings, attributes below
Required:
    - resource_id
    - resource_type
Optional:
    - im (block):
        - connection_id (required)
        - connection_type (required)
        - escalation_policies (required)
        - is_auto_approval_enabled (required)
    - itsm (block):
        - connection_id (required)
        - connection_type (required)
        - is_itsm_enabled (required)
        - itsm_filter_criteria (optional, block):
            - filter (required)
            - supported_ticket_type (required)
    - justification_settings (block):
        - is_justification_required (required)
        - justification_regex (optional)
EOT

  type = map(object({
    resource_id   = string
    resource_type = string
    im = optional(list(object({
      connection_id            = string
      connection_type          = string
      escalation_policies      = set(string)
      is_auto_approval_enabled = bool
    })))
    itsm = optional(list(object({
      connection_id   = string
      connection_type = string
      is_itsm_enabled = bool
      itsm_filter_criteria = optional(list(object({
        filter                = string
        supported_ticket_type = string
      })))
    })))
    justification_settings = optional(list(object({
      is_justification_required = bool
      justification_regex       = optional(string)
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.advanced_settings : (
        contains([for v in ["APPLICATION", "PROFILE", "PROFILE_POLICY", "RESOURCE_MANAGER_PROFILE", "RESOURCE_MANAGER_PROFILE_POLICY"] : lower(v)], lower(v.resource_type))
      )
    ])
    error_message = "must be one of: \"APPLICATION\", \"PROFILE\", \"PROFILE_POLICY\", \"RESOURCE_MANAGER_PROFILE\", \"RESOURCE_MANAGER_PROFILE_POLICY\""
  }
  validation {
    condition = alltrue([
      for k, v in var.advanced_settings : (
        v.itsm == null || alltrue([for item in v.itsm : (item.itsm_filter_criteria == null || alltrue([for item in item.itsm_filter_criteria : (length(item.filter) >= 1)]))])
      )
    ])
    error_message = "must not be empty"
  }
}

