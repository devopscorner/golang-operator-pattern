# ==========================================================================
#  111122223333 - IAM: output.tf
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
output "developer_group_name" {
  description = "Developer Group Name"
  value       = module.iam-user.developer_group_name
}

output "developer_group_arn" {
  description = "Developer Group Name"
  value       = module.iam-user.developer_group_arn
}

output "admin_group_name" {
  description = "Administrator Group Name"
  value       = module.iam-user.admin_group_name
}

output "admin_group_arn" {
  description = "Administrator Group Name"
  value       = module.iam-user.admin_group_arn
}

# --------------------------------------------------------------------------
#  List Policy
# --------------------------------------------------------------------------
output "dci_developer_policy" {
  description = "DCI Developer Policy Name"
  value       = module.iam-user.dci_developer_policy
}

output "dci_developer_policy_arn" {
  description = "DCI Developer Policy ARN"
  value       = module.iam-user.dci_developer_policy_arn
}

# --------------------------------------------------------------------------
#  List User
# --------------------------------------------------------------------------
output "list_dci_developer" {
  description = "DCI Developer Account"
  value       = module.iam-user.list_dci_developer
}

output "list_dci_administrator" {
  description = "DCI Administrator Account"
  value       = module.iam-user.list_dci_administrator
}

output "list_csiro_developer" {
  description = "CSIRO Developer Account"
  value       = module.iam-user.list_csiro_developer
}

output "list_csiro_administrator" {
  description = "CSIRO Administrator Account"
  value       = module.iam-user.list_csiro_administrator
}

# --------------------------------------------------------------------------
#  Summary
# --------------------------------------------------------------------------
output "summary" {
  description = "Summary IAM User Configuration"
  value       = module.iam-user.summary
}