data "azurerm_subscription" "current" {}

module "mod_sub_budget" {
  source = "../../modules/budgets/subscription"

  # Management Group
  #####################################
  ## Budget Configuration           ###
  #####################################

  budget_name       = "Example Subscription Budget"
  budget_amount     = 14000
  budget_time_grain = "Monthly"
  budget_category   = "Cost"
  budget_scope      = data.azurerm_subscription.current.id
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

