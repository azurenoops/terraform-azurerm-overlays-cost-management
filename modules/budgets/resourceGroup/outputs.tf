output " rg_budget_id " {
  value       = azurerm_consumption_budget_resource_group.rg_budget.id
  description = "The ID of the budget."
}

output " rg_budget_name " {
  value       = azurerm_consumption_budget_resource_group.rg_budget.name
  description = "The Name of the budget."
}

output " rg_budget_amount " {
  value       = azurerm_consumption_budget_resource_group.rg_budget.amount
  description = "The Amount of the budget."
}

output " rg_budget_time_grain " {
  value       = azurerm_consumption_budget_resource_group.rg_budget.time_grain
  description = "The Time Grain of the budget."
}

output " rg_budget_time_period " {
  value       = azurerm_consumption_budget_resource_group.rg_budget.resource_group_id
  description = " The resource group of the budget."
}

