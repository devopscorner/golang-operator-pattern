# ==========================================================================
#  111122223333 - Budget: output.tf
# --------------------------------------------------------------------------
#  Description:
#    Output Terraform Value
# --------------------------------------------------------------------------
#    - Billing Monthly Forcasted Info
#    - Billing Monthly Forcasted Notif
#    - Billing Monthly Billing Info
#    - Billing Monthly Billing Notif
# ==========================================================================

output "billing_monthly_forcasted_info" {
  description = "Monthly forcasted billing info"
  value = {
    billing_name        = module.budget.billing_monthly_forcasted_info.billing_name
    billing_type        = module.budget.billing_monthly_forcasted_info.billing_type
    billing_limit       = module.budget.billing_monthly_forcasted_info.billing_limit
    billing_limit_unit  = module.budget.billing_monthly_forcasted_info.billing_limit_unit
    billing_time_unit   = module.budget.billing_monthly_forcasted_info.billing_time_unit
    billing_time_period = module.budget.billing_monthly_forcasted_info.billing_time_period
  }
}

output "billing_monthly_forcasted_notif" {
  description = "Monthly forcasted billing notification email"
  value = {
    notif_operator = module.budget.billing_monthly_forcasted_notif.notif_operator
  }
}

output "billing_monthly_billing_info" {
  description = "Monthly budget billing info"
  value = {
    billing_name        = module.budget.billing_monthly_billing_info.billing_name
    billing_type        = module.budget.billing_monthly_billing_info.billing_type
    billing_limit       = module.budget.billing_monthly_billing_info.billing_limit
    billing_limit_unit  = module.budget.billing_monthly_billing_info.billing_limit_unit
    billing_time_unit   = module.budget.billing_monthly_billing_info.billing_time_unit
    billing_time_period = module.budget.billing_monthly_billing_info.billing_time_period
  }
}

output "billing_monthly_billing_notif" {
  description = "Monthly budget billing notification email"
  value = {
    notif_operator = module.budget.billing_monthly_billing_notif.notif_operator
  }
}
