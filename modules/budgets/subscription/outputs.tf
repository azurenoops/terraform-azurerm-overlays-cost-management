output "sub_budget_id" {
  value       = azurerm_consumption_budget_subscription.sub_budget.id
  description = "The ID of the budget."
}

output "sub_budget_name" {
  value       = azurerm_consumption_budget_subscription.sub_budget.name
  description = "The Name of the budget."
}

output "sub_budget_amount" {
  value       = azurerm_consumption_budget_subscription.sub_budget.amount
  description = "The Amount of the budget."
}

output "sub_budget_time_grain" {
  value       = azurerm_consumption_budget_subscription.sub_budget.time_grain
  description = "The Time Grain of the budget."
}

output "sub_budget_time_period" {
  value       = azurerm_consumption_budget_subscription.sub_budget.subscription_id
  description = " The subscription of the budget."
}

