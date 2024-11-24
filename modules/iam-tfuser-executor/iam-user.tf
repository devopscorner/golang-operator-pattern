# ==========================================================================
#  Module IAM TFUser: iam-user.tf
# --------------------------------------------------------------------------
#  Description:
#    IAM List Account
# --------------------------------------------------------------------------
#    - List Administrator Account
#    - List Developer Account
# ==========================================================================

# --------------------------------------------------------------------------
#  IAM User
# --------------------------------------------------------------------------
resource "aws_iam_user" "tf_user_executor" {
  provider = aws.destination
  name     = var.tf_user_executor

  tags = merge(
    local.tags,
    {
      Name      = "${var.tf_user_executor}"
      Services  = "IAM"
      Terraform = "true"
    }
  )
}
