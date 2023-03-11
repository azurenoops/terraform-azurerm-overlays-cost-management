data "azurerm_management_group" "current" {
  display_name = "anoa"
}

module "mod_mg_budget" {
  source = "../../modules/budgets/managementGroup"

  # Management Group
  #####################################
  ## Budget Configuration           ###
  #####################################

  budget_name       = "Example Management Group Budget"
  budget_amount     = 14000
  budget_time_grain = "Monthly"
  budget_category   = "Cost"
  budget_scope      = data.azurerm_management_group.current.id
  budget_time_period = {
    start_date = "2023-03-01T00:00:00Z"
    end_date   = "2024-04-01T00:00:00Z"
  }
  budget_notification = [
    {
      enabled        = true
      operator       = "GreaterThan"
      threshold      = 90
      contact_emails = ["jrspinella@live.com"]
    }
  ]
}

