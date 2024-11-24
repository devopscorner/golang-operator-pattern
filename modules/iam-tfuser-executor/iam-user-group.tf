# ==========================================================================
#  Module IAM TFUser: iam-user-group.tf
# --------------------------------------------------------------------------
#  Description:
#    IAM Grouping User
# --------------------------------------------------------------------------
#    - Group Administrator
#    - Group Developer
# ==========================================================================

# --------------------------------------------------------------------------
#  IAM User Group (Administrator)
# --------------------------------------------------------------------------
resource "aws_iam_user_group_membership" "tf_user_executor" {
  provider = aws.destination
  user     = aws_iam_user.tf_user_executor.name

  groups = [
    aws_iam_group.tf_administrator.name,
  ]
}
