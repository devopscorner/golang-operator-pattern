# ==========================================================================
#  111122223333 - IAM TFUser-Executor: output.tf
# --------------------------------------------------------------------------
#  Description
#    Output Terraform Value
# --------------------------------------------------------------------------
#    - List Group
#    - List Policy
#    - List Role
#    - List User
# ==========================================================================

# --------------------------------------------------------------------------
#  List Group
# --------------------------------------------------------------------------
output "admin_group_name" {
  description = "Administrator Group Name"
  value       = module.iam-tfuser.admin_group_name
}

output "admin_group_arn" {
  description = "Administrator Group Name"
  value       = module.iam-tfuser.admin_group_arn
}

# --------------------------------------------------------------------------
#  List Terraform
# --------------------------------------------------------------------------
output "tfrole_central" {
  description = "Terraform Central Role"
  value       = module.iam-tfuser.tfrole_central
}

output "tfrole_central_arn" {
  description = "Terraform Central Role"
  value       = module.iam-tfuser.tfrole_central_arn
}

# --------------------------------------------------------------------------
#  List User
# --------------------------------------------------------------------------
output "tf_user_executor_account" {
  description = "TF-User-Executor Account Name"
  value       = module.iam-tfuser.tf_user_executor_account
}

output "tf_user_executor_arn" {
  description = "TF-User-Executor ARN"
  value       = module.iam-tfuser.tf_user_executor_arn
}

# --------------------------------------------------------------------------
#  Summary
# --------------------------------------------------------------------------
output "summary" {
  description = "Summary IAM TF-User Configuration"
  value       = module.iam-tfuser.summary
}