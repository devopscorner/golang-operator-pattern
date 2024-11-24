# ==========================================================================
#  Module IAM TFUser: iam-role.tf
# --------------------------------------------------------------------------
#  Description:
#    IAM User Role
# --------------------------------------------------------------------------
#    - Role Name
#    - Assume Role
#    - Inline Policy
# ==========================================================================

locals {
  TrustedEntities = {
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : [
            "arn:aws:iam::${var.aws_account_id_destination}:user/TF-User-Executor-${var.aws_account_id_destination}",
            "arn:aws:iam::307946671795:root",
            "arn:aws:iam::864899849921:root",
            "arn:aws:iam::688567276772:root",
            "arn:aws:iam::209479276142:root",
            "arn:aws:iam::111122223333:root",
            "arn:aws:iam::586794473955:root"
          ]
        },
        "Action" : [
          "sts:AssumeRole",
          "sts:TagSession",
          "sts:SetSourceIdentity"
        ],
        "Condition" : {}
      }
    ]
  }
}

# --------------------------------------------------------------------------
#  IAM Role
# --------------------------------------------------------------------------
resource "aws_iam_role" "tfcentral" {
  provider    = aws.destination
  name        = "TF-Central-Role_${var.aws_account_id_destination}"
  description = "Allows TF-Central-Role for Terraform"

  assume_role_policy = jsonencode(local.TrustedEntities)

  tags = merge(
    local.tags
  )
}
