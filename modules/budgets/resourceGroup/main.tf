# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

resource "azurerm_consumption_budget_resource_group" "rg_budget" {
  name              = var.budget_name
  resource_group_id = var.budget_scope

  amount     = var.budget_amount
  time_grain = var.budget_time_grain

  dynamic "time_period" {
    for_each = var.budget_time_period
    content {
      start_date = time_period.value.start_date
      end_date   = time_period.value.end_date
    }
  }

  dynamic "filter" {
    for_each = var.budget_filter != null ? [dimension] : []
    content {
      name     = filter.value.name
      operator = filter.value.operator
      values   = filter.value.values
    }
  }

  dynamic "notification" {
    for_each = var.budget_notification
    content {
      enabled        = notification.value.enabled
      threshold      = notification.value.threshold
      operator       = notification.value.operator
      threshold_type = notification.value.threshold_type

      contact_emails = notification.value.contact_emails

      contact_groups = notification.value.contact_groups

    }
  }
}
