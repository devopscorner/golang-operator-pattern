# ==========================================================================
#  Module IAM TFUser: output.tf
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
  value       = aws_iam_group.tf_administrator.name
}

output "admin_group_arn" {
  description = "Administrator Group Name"
  value       = aws_iam_group.tf_administrator.arn
}

# --------------------------------------------------------------------------
#  List Terraform
# --------------------------------------------------------------------------
output "tfrole_central" {
  description = "Terraform Central Role"
  value       = aws_iam_role.tfcentral.name
}

output "tfrole_central_arn" {
  description = "Terraform Central Role"
  value       = aws_iam_role.tfcentral.arn
}

# --------------------------------------------------------------------------
#  List User
# --------------------------------------------------------------------------
output "tf_user_executor_account" {
  description = "TF-User-Executor Account Name"
  value       = aws_iam_user.tf_user_executor.name
}

output "tf_user_executor_arn" {
  description = "TF-User-Executor ARN"
  value       = aws_iam_user.tf_user_executor.arn
}

# --------------------------------------------------------------------------
#  Summary
# --------------------------------------------------------------------------
locals {
  summary = <<SUMMARY
Administrator:
  Group Name:        ${aws_iam_group.tf_administrator.name}
  Group ARN:         ${aws_iam_group.tf_administrator.arn}
  Policy ARN:
    - ${local.ARN_Policy_AdministratorAccess}
    - ${local.ARN_Policy_AWSOrganizationsFullAccess}
Terraform (TF):
  TF User:           ${aws_iam_role.tfcentral.name}
  TF ARN:            ${aws_iam_role.tfcentral.arn}
  TF Role:           ${aws_iam_user.tf_user_executor.name}
  TF Role ARN:       ${aws_iam_user.tf_user_executor.arn}
SUMMARY
}

output "summary" {
  description = "Summary IAM TF-User Configuration"
  value       = local.summary
}
