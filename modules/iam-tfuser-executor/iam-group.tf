# ==========================================================================
#  Module IAM TFUser: iam-group.tf
# --------------------------------------------------------------------------
#  Description:
#    IAM Group Name
# --------------------------------------------------------------------------
#    - Group Developer
#    - Group Administrator
# ==========================================================================

# --------------------------------------------------------------------------
#  IAM Group
# --------------------------------------------------------------------------
resource "aws_iam_group" "tf_administrator" {
  provider = aws.destination
  name     = "${var.group_tf_administrator}_${var.aws_account_id_destination}_${var.workspace_env[local.env]}"
}
