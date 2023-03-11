output "mg_budget_id" {
  value       = azurerm_consumption_budget_management_group.mg_budget.id
  description = "The ID of the budget."
}

output "mg_budget_name" {
  value       = azurerm_consumption_budget_management_group.mg_budget.name
  description = "The Name of the budget."
}

output "mg_budget_amount" {
  value       = azurerm_consumption_budget_management_group.mg_budget.amount
  description = "The Amount of the budget."
}

output "mg_budget_time_grain" {
  value       = azurerm_consumption_budget_management_group.mg_budget.time_grain
  description = "The Time Grain of the budget."
}

output "mg_budget_time_period" {
  value       = azurerm_consumption_budget_management_group.mg_budget.management_group_id
  description = " The Management Group of the budget."
}



