# ==========================================================================
#  Module IAM TFUser: iam-policy.tf
# --------------------------------------------------------------------------
#  Description:
#    IAM Policy
# --------------------------------------------------------------------------
#    - Policy Administrator
#    - Policy Developer
# ==========================================================================

locals {
  ARN_Policy_AdministratorAccess        = "arn:aws:iam::aws:policy/AdministratorAccess"
  ARN_Policy_AWSOrganizationsFullAccess = "arn:aws:iam::aws:policy/AWSOrganizationsFullAccess"
}

# --------------------------------------------------------------------------
#  Bind Role - Policy
# --------------------------------------------------------------------------
# Role: TF-User-Executor
resource "aws_iam_role_policy_attachment" "policy_administrator_role" {
  provider   = aws.destination
  policy_arn = local.ARN_Policy_AdministratorAccess
  role       = aws_iam_role.tfcentral.name
}

resource "aws_iam_role_policy_attachment" "policy_organization_access_role" {
  provider   = aws.destination
  policy_arn = local.ARN_Policy_AWSOrganizationsFullAccess
  role       = aws_iam_role.tfcentral.name
}

# --------------------------------------------------------------------------
#  Bind Group - Policy
# --------------------------------------------------------------------------
# Group: tf-administrator
resource "aws_iam_group_policy_attachment" "policy_administrator_group" {
  provider   = aws.destination
  policy_arn = local.ARN_Policy_AdministratorAccess
  group      = aws_iam_group.tf_administrator.name
}

resource "aws_iam_group_policy_attachment" "policy_organization_access_group" {
  provider   = aws.destination
  policy_arn = local.ARN_Policy_AWSOrganizationsFullAccess
  group      = aws_iam_group.tf_administrator.name
}
