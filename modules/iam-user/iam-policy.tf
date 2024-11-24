# ==========================================================================
#  Module IAM User: iam-policy.tf
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
  ARN_Policy_AmazonDynamoDBFullAccess   = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
  ARN_Policy_AmazonRedshiftFullAccess   = "arn:aws:iam::aws:policy/AmazonRedshiftFullAccess"
  ARN_Policy_AWSLambda_FullAccess       = "arn:aws:iam::aws:policy/AWSLambda_FullAccess"
  ARN_Policy_AmazonS3FullAccess         = "arn:aws:iam::aws:policy/AmazonS3FullAccess"

  # --------------------------------------------------------------------------
  #  Customize Policy
  # --------------------------------------------------------------------------
  Policy_Developer = {
    "Version" : "2012-10-17",
    "Statement" : [
      # --------------------------------------------------------------------------
      #  Lambda Full Access
      # --------------------------------------------------------------------------
      {
        "Effect" : "Allow",
        "Action" : [
          "cloudformation:DescribeStacks",
          "cloudformation:ListStackResources",
          "cloudwatch:ListMetrics",
          "cloudwatch:GetMetricData",
          "ec2:DescribeSecurityGroups",
          "ec2:DescribeSubnets",
          "ec2:DescribeVpcs",
          "kms:ListAliases",
          "iam:GetPolicy",
          "iam:GetPolicyVersion",
          "iam:GetRole",
          "iam:GetRolePolicy",
          "iam:ListAttachedRolePolicies",
          "iam:ListRolePolicies",
          "iam:ListRoles",
          "lambda:*",
          "logs:DescribeLogGroups",
          "states:DescribeStateMachine",
          "states:ListStateMachines",
          "tag:GetResources",
          "xray:GetTraceSummaries",
          "xray:BatchGetTraces"
        ],
        "Resource" : "*"
      },
      {
        "Effect" : "Allow",
        "Action" : "iam:PassRole",
        "Resource" : "*",
        "Condition" : {
          "StringEquals" : {
            "iam:PassedToService" : "lambda.amazonaws.com"
          }
        }
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "logs:DescribeLogStreams",
          "logs:GetLogEvents",
          "logs:FilterLogEvents"
        ],
        "Resource" : "arn:aws:logs:*:*:log-group:/aws/lambda/*"
      },
      # --------------------------------------------------------------------------
      #  EC2 Full Access
      # --------------------------------------------------------------------------
      {
        "Action" : "ec2:*",
        "Effect" : "Allow",
        "Resource" : "*"
      },
      {
        "Effect" : "Allow",
        "Action" : "elasticloadbalancing:*",
        "Resource" : "*"
      },
      {
        "Effect" : "Allow",
        "Action" : "cloudwatch:*",
        "Resource" : "*"
      },
      {
        "Effect" : "Allow",
        "Action" : "autoscaling:*",
        "Resource" : "*"
      },
      {
        "Effect" : "Allow",
        "Action" : "iam:CreateServiceLinkedRole",
        "Resource" : "*",
        "Condition" : {
          "StringEquals" : {
            "iam:AWSServiceName" : [
              "autoscaling.amazonaws.com",
              "ec2scheduled.amazonaws.com",
              "elasticloadbalancing.amazonaws.com",
              "spot.amazonaws.com",
              "spotfleet.amazonaws.com",
              "transitgateway.amazonaws.com"
            ]
          }
        }
      },
      # --------------------------------------------------------------------------
      #  S3 Full Access
      # --------------------------------------------------------------------------
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:*",
          "s3-object-lambda:*"
        ],
        "Resource" : "*"
      }
    ]
  }
}

# --------------------------------------------------------------------------
#  Identity Policy
# --------------------------------------------------------------------------
resource "aws_iam_policy" "dci_developer_policy" {
  provider    = aws.destination
  name        = "${var.policy_dci_developer}_${var.aws_account_id_destination}_${var.workspace_env[local.env]}"
  path        = "/"
  description = "DCI Policy for Developer"

  policy = jsonencode(
    merge(
      local.Policy_Developer
    ),
  )
}

resource "aws_iam_policy" "dci_poweruser_acess" {
  provider    = aws.destination
  name        = "dci-poweruseraccess_${var.aws_account_id_destination}_${var.workspace_env[local.env]}"
  path        = "/"
  description = "DCI Policy for PowerUser Access"

  policy = jsonencode(
    merge(
      local.PowerUserAccess
    ),
  )
}

resource "aws_iam_policy" "dci_iamfull_acess" {
  provider    = aws.destination
  name        = "dci-iamfullaccess_${var.aws_account_id_destination}_${var.workspace_env[local.env]}"
  path        = "/"
  description = "DCI Policy for IAMFull Access"

  policy = jsonencode(
    merge(
      local.PowerUserAccess
    ),
  )
}

# --------------------------------------------------------------------------
#  Bind Group - Policy
# --------------------------------------------------------------------------
# Group: dci-developer
# resource "aws_iam_group_policy_attachment" "policy_developer_custom" {
#   policy_arn = aws_iam_policy.dci_developer_policy.arn
#   group      = aws_iam_group.dci_developer.name
# }

resource "aws_iam_group_policy_attachment" "policy_poweruser_access" {
  provider   = aws.destination
  policy_arn = aws_iam_policy.dci_poweruser_acess.arn
  group      = aws_iam_group.dci_developer.name
}

resource "aws_iam_group_policy_attachment" "policy_developer_dynamodb" {
  provider   = aws.destination
  policy_arn = local.ARN_Policy_AmazonDynamoDBFullAccess
  group      = aws_iam_group.dci_developer.name
}

resource "aws_iam_group_policy_attachment" "policy_developer_redshift" {
  provider   = aws.destination
  policy_arn = local.ARN_Policy_AmazonRedshiftFullAccess
  group      = aws_iam_group.dci_developer.name
}

resource "aws_iam_group_policy_attachment" "policy_developer_lambda" {
  provider   = aws.destination
  policy_arn = local.ARN_Policy_AWSLambda_FullAccess
  group      = aws_iam_group.dci_developer.name
}

resource "aws_iam_group_policy_attachment" "policy_developer_s3" {
  provider   = aws.destination
  policy_arn = local.ARN_Policy_AmazonS3FullAccess
  group      = aws_iam_group.dci_developer.name
}

# Group: dci-administrator
resource "aws_iam_group_policy_attachment" "policy_iamfull_access" {
  provider   = aws.destination
  policy_arn = aws_iam_policy.dci_iamfull_acess.arn
  group      = aws_iam_group.dci_administrator.name
}

resource "aws_iam_group_policy_attachment" "policy_administrator_group" {
  provider   = aws.destination
  policy_arn = local.ARN_Policy_AdministratorAccess
  group      = aws_iam_group.dci_administrator.name
}

resource "aws_iam_group_policy_attachment" "policy_organization_access_group" {
  provider   = aws.destination
  policy_arn = local.ARN_Policy_AWSOrganizationsFullAccess
  group      = aws_iam_group.dci_administrator.name
}
