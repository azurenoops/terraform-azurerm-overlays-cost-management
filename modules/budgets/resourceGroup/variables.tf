# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

###########################
# Budgets Configuration  ##
###########################

variable "budget_scope" {
  description = "(Required) The scope of the budget. Must be `resource group id`"
  type        = string
}

variable "budget_amount" {
  description = "(Required) The amount of cost or usage being measured for a budget"
  type        = string
}

variable "budget_name" {
  description = "(Required) The name of the budget"
  type        = string
}

variable "budget_category" {
  description = "The category of the budget, whether the budget tracks cost or usage"
  type        = string
  default     = null
}

variable "budget_time_grain" {
  description = <<EOT
(Optional) The time covered by a budget. Tracking of the amount will be reset based on the time grain.
Must be one of `BillingAnnual`, `BillingMonth`, `BillingQuarter`, `Annually`, `Monthly` and `Quarterly`.
Defaults to `Monthly`. Changing this forces a new resource to be created."
EOT
  type        = string
  default     = "Monthly"
}

variable "budget_time_period" {
  description = <<EOT
(Optional)  The start and end dates of the budget. If not provided, the budget will cover the current month. Changing this forces a new resource to be created.
EOT
  type = object({
    start_date = string
    end_date   = string
  })
  default = null
}

/* variable "budget_filter" {
  description = <<EOT
(Optional)  The filter that is used to scope a budget. The filter can be limited to a set of cost centers, resource groups, or resources. Changing this forces a new resource to be created.
EOT
  type = list(object({
    name     = string
    operator = optional(string)
    values   = list(string)
  }))
  default = null
} */

variable "budget_notification" {
  description = "The notification associated with a budget. Budget notification is required in order to create a budget"
  type = list(object({
    enabled        = bool
    operator       = string
    threshold      = number
    threshold_type = optional(string)
    contact_emails = list(string)
    contact_groups = optional(list(string))
    contact_roles  = optional(list(string))
  }))
  default = null
}

