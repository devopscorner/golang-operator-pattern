# ==========================================================================
#  111122223333 - Budget: main.tf
# --------------------------------------------------------------------------
#  Description:
#    Main Terraform Module
# --------------------------------------------------------------------------
#    - Workspace Environment
#    - Common Tags
# ==========================================================================

# --------------------------------------------------------------------------
#  Reuse Module: Budget
# --------------------------------------------------------------------------
module "budget" {
  source = "../../../modules//budget"

  aws_region                      = var.aws_region
  aws_account_id_source           = var.aws_account_id_source
  aws_account_id_destination      = var.aws_account_id_destination
  aws_account_profile_source      = var.aws_account_profile_source
  aws_account_profile_destination = var.aws_account_profile_destination
  aws_access_key                  = var.aws_access_key
  aws_secret_key                  = var.aws_secret_key
  workspace_name                  = var.workspace_name
  workspace_env                   = var.workspace_env
  environment                     = var.environment
  department                      = var.department

  monthly_forcasted_name                    = var.monthly_forcasted_name
  monthly_forcasted_limit_amount            = var.monthly_forcasted_limit_amount
  monthly_forcasted_limit_unit              = var.monthly_forcasted_limit_unit
  monthly_forcasted_notification_subscriber = var.monthly_forcasted_notification_subscriber
  monthly_budget_name                       = var.monthly_budget_name
  monthly_budget_limit_amount               = var.monthly_budget_limit_amount
  monthly_budget_limit_unit                 = var.monthly_budget_limit_unit
  monthly_budget_notification_subscriber    = var.monthly_budget_notification_subscriber
}
