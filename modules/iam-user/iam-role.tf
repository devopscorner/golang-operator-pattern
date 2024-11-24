# ==========================================================================
#  Module IAM User: iam-role.tf
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
            "arn:aws:iam::111122223333:user/TF-User-Executor-111122223333",
            "arn:aws:iam::307946671795:root",
            "arn:aws:iam::864899849921:root",
            "arn:aws:iam::688567276772:root",
            "arn:aws:iam::209479276142:root",
            "arn:aws:iam::111122223333:root",
            "arn:aws:iam::586794473955:root"
          ]
        },
        "Action" : "sts:AssumeRole",
        "Condition" : {}
      }
    ]
  }

  IAMFullAccess = {
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "iam:*",
          "organizations:DescribeAccount",
          "organizations:DescribeOrganization",
          "organizations:DescribeOrganizationalUnit",
          "organizations:DescribePolicy",
          "organizations:ListChildren",
          "organizations:ListParents",
          "organizations:ListPoliciesForTarget",
          "organizations:ListRoots",
          "organizations:ListPolicies",
          "organizations:ListTargetsForPolicy"
        ],
        "Resource" : "*"
      }
    ]
  }

  PowerUserAccess = {
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "NotAction" : [
          "iam:*",
          "organizations:*",
          "account:*"
        ],
        "Resource" : "*"
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "account:GetAccountInformation",
          "account:GetPrimaryEmail",
          "account:ListRegions",
          "iam:CreateServiceLinkedRole",
          "iam:DeleteServiceLinkedRole",
          "iam:ListRoles",
          "organizations:DescribeOrganization"
        ],
        "Resource" : "*"
      }
    ]
  }
}
