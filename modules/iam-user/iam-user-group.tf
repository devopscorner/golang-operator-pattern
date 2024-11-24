# ==========================================================================
#  Module IAM User: iam-user-group.tf
# --------------------------------------------------------------------------
#  Description:
#    IAM Grouping User
# --------------------------------------------------------------------------
#    - Group Administrator
#    - Group Developer
# ==========================================================================

# --------------------------------------------------------------------------
#  IAM User Group (Developer)
# --------------------------------------------------------------------------
resource "aws_iam_user_group_membership" "dci_developer" {
  provider = aws.destination
  for_each = toset(
    local.dci_team_developer
  )

  user = lower(each.key)

  groups = [
    aws_iam_group.dci_developer.name,
  ]
}

# --------------------------------------------------------------------------
#  IAM User Group (Administrator)
# --------------------------------------------------------------------------
resource "aws_iam_user_group_membership" "dci_team_administrator" {
  provider = aws.destination
  for_each = toset(
    local.dci_team_administrator
  )

  user = lower(each.key)

  groups = [
    aws_iam_group.dci_administrator.name,
  ]
}
