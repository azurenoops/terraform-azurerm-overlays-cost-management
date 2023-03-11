# Azure Cost Managmement - Resource Group Budget Overlay

[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![MIT License](https://img.shields.io/badge/license-MIT-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/azurenoops/overlays-redis/azurerm/)

This Overlay terraform module can create a budget for an resource group. This module is part of the Azure Cost Management Overlay.

## Usage

```hcl
module "budgets_resource_group" {
  source = "azurenoops/overlays-budgets/azurerm//modules/resourceGroup"

  # Subscription Budget
  #####################################
  ## Budget Configuration           ###
  #####################################

  budget_name       = "Example Subscription Budget"
  budget_amount     = 14000
  budget_time_grain = "Monthly"
  budget_category   = "Cost"
  budget_scope      = var.resource_group_id
  budget_time_period = {
    start_date = "2023-03-01T00:00:00Z"
    end_date   = "2024-04-01T00:00:00Z"
  }
  budget_notification = [
    {
      enabled        = true
      operator       = "GreaterThan"
      threshold      = 90
      contact_emails = ["john.doe@live.com"]
    }
  ]
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.22 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.22 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_consumption_budget_resource_group.rg_budget](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/consumption_budget_resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_budget_amount"></a> [budget\_amount](#input\_budget\_amount) | (Required) The amount of cost or usage being measured for a budget | `string` | n/a | yes |
| <a name="input_budget_category"></a> [budget\_category](#input\_budget\_category) | The category of the budget, whether the budget tracks cost or usage | `string` | `null` | no |
| <a name="input_budget_name"></a> [budget\_name](#input\_budget\_name) | (Required) The name of the budget | `string` | n/a | yes |
| <a name="input_budget_notification"></a> [budget\_notification](#input\_budget\_notification) | The notification associated with a budget. Budget notification is required in order to create a budget | <pre>list(object({<br>    enabled        = bool<br>    operator       = string<br>    threshold      = number<br>    threshold_type = optional(string)<br>    contact_emails = list(string)<br>    contact_groups = optional(list(string))<br>    contact_roles  = optional(list(string))<br>  }))</pre> | `null` | no |
| <a name="input_budget_scope"></a> [budget\_scope](#input\_budget\_scope) | (Required) The scope of the budget. Must be `resource group id` | `string` | n/a | yes |
| <a name="input_budget_time_grain"></a> [budget\_time\_grain](#input\_budget\_time\_grain) | (Optional) The time covered by a budget. Tracking of the amount will be reset based on the time grain.<br>Must be one of `BillingAnnual`, `BillingMonth`, `BillingQuarter`, `Annually`, `Monthly` and `Quarterly`.<br>Defaults to `Monthly`. Changing this forces a new resource to be created." | `string` | `"Monthly"` | no |
| <a name="input_budget_time_period"></a> [budget\_time\_period](#input\_budget\_time\_period) | (Optional)  The start and end dates of the budget. If not provided, the budget will cover the current month. Changing this forces a new resource to be created. | <pre>object({<br>    start_date = string<br>    end_date   = string<br>  })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ rg_budget_amount "></a> [ rg\_budget\_amount ](#output\_ rg\_budget\_amount ) | The Amount of the budget. |
| <a name="output_ rg_budget_id "></a> [ rg\_budget\_id ](#output\_ rg\_budget\_id ) | The ID of the budget. |
| <a name="output_ rg_budget_name "></a> [ rg\_budget\_name ](#output\_ rg\_budget\_name ) | The Name of the budget. |
| <a name="output_ rg_budget_time_grain "></a> [ rg\_budget\_time\_grain ](#output\_ rg\_budget\_time\_grain ) | The Time Grain of the budget. |
| <a name="output_ rg_budget_time_period "></a> [ rg\_budget\_time\_period ](#output\_ rg\_budget\_time\_period ) | The resource group of the budget. |
<!-- END_TF_DOCS -->