# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

resource "azurerm_consumption_budget_management_group" "mg_budget" {
  name                = var.budget_name
  management_group_id = var.budget_scope

  amount     = var.budget_amount
  time_grain = var.budget_time_grain

  time_period {
    start_date = var.budget_time_period.start_date
    end_date   = var.budget_time_period.end_date
  }

  /* filter {
    dynamic "dimension" {
      for_each = var.budget_filter != null ? ["dimension"] : []
      content {
        name     = filter.0.dimension.value.name
        operator = filter.0.dimension.value.operator
        values   = filter.0.dimension.value.values
      }
    }
  } */

  dynamic "notification" {
    for_each = var.budget_notification
    content {
      enabled        = notification.value.enabled
      threshold      = notification.value.threshold
      operator       = notification.value.operator
      threshold_type = notification.value.threshold_type

      contact_emails = notification.value.contact_emails
    }
  }
}
