# ==========================================================================
#  Module TFState: iam.tf
# --------------------------------------------------------------------------
#  Description:
#    IAM Role & Policy Access Resources
# --------------------------------------------------------------------------
#    - IAM Policy for Resources
# ==========================================================================

# --------------------------------------------------------------------------
#  S3 Bucket Policy
# --------------------------------------------------------------------------
resource "aws_iam_role" "bucket" {
  provider = aws.destination
  name     = "iam_tfstate_bucket_${var.aws_account_id_destination}-${var.workspace_env[local.env]}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

data "aws_iam_policy_document" "bucket_policy" {
  statement {
    principals {
      type = "AWS"
      identifiers = [
        aws_iam_role.bucket.arn,
        "arn:aws:iam::688567276772:root",
        "arn:aws:iam::586794473955:root",
        "arn:aws:iam::307946671795:root",
        "arn:aws:iam::864899849921:root",
        "arn:aws:iam::209479276142:root"
      ]
    }

    actions = [
      "s3:ListBucket",
    ]

    resources = [
      "arn:aws:s3:::${local.bucket_name}",
    ]
  }
}

resource "aws_iam_role" "dynamodb" {
  provider = aws.destination
  name     = "iam_tfstate_dynamodb_${var.aws_account_id_destination}-${var.workspace_env[local.env]}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": [
          "dax.amazonaws.com",
          "replication.dynamodb.amazonaws.com"
        ]
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

data "aws_iam_policy_document" "dynamodb_policy" {
  statement {
    principals {
      type = "AWS"
      identifiers = [
        aws_iam_role.dynamodb.arn,
        "arn:aws:iam::688567276772:root",
        "arn:aws:iam::586794473955:root",
        "arn:aws:iam::307946671795:root",
        "arn:aws:iam::864899849921:root",
        "arn:aws:iam::209479276142:root"
      ]
    }

    actions = [
      "dynamodb:*",
      "dax:*",
      "application-autoscaling:DeleteScalingPolicy",
      "application-autoscaling:DeregisterScalableTarget",
      "application-autoscaling:DescribeScalableTargets",
      "application-autoscaling:DescribeScalingActivities",
      "application-autoscaling:DescribeScalingPolicies",
      "application-autoscaling:PutScalingPolicy",
      "application-autoscaling:RegisterScalableTarget",
      "cloudwatch:DeleteAlarms",
      "cloudwatch:DescribeAlarmHistory",
      "cloudwatch:DescribeAlarms",
      "cloudwatch:DescribeAlarmsForMetric",
      "cloudwatch:GetMetricStatistics",
      "cloudwatch:ListMetrics",
      "cloudwatch:PutMetricAlarm",
      "cloudwatch:GetMetricData",
      "datapipeline:ActivatePipeline",
      "datapipeline:CreatePipeline",
      "datapipeline:DeletePipeline",
      "datapipeline:DescribeObjects",
      "datapipeline:DescribePipelines",
      "datapipeline:GetPipelineDefinition",
      "datapipeline:ListPipelines",
      "datapipeline:PutPipelineDefinition",
      "datapipeline:QueryObjects",
      "ec2:DescribeVpcs",
      "ec2:DescribeSubnets",
      "ec2:DescribeSecurityGroups",
      "iam:GetRole",
      "iam:ListRoles",
      "kms:DescribeKey",
      "kms:ListAliases",
      "sns:CreateTopic",
      "sns:DeleteTopic",
      "sns:ListSubscriptions",
      "sns:ListSubscriptionsByTopic",
      "sns:ListTopics",
      "sns:Subscribe",
      "sns:Unsubscribe",
      "sns:SetTopicAttributes",
      "lambda:CreateFunction",
      "lambda:ListFunctions",
      "lambda:ListEventSourceMappings",
      "lambda:CreateEventSourceMapping",
      "lambda:DeleteEventSourceMapping",
      "lambda:GetFunctionConfiguration",
      "lambda:DeleteFunction",
      "resource-groups:ListGroups",
      "resource-groups:ListGroupResources",
      "resource-groups:GetGroup",
      "resource-groups:GetGroupQuery",
      "resource-groups:DeleteGroup",
      "resource-groups:CreateGroup",
      "tag:GetResources",
      "kinesis:ListStreams",
      "kinesis:DescribeStream",
      "kinesis:DescribeStreamSummary"
    ]

    resources = [
      "arn:aws:dynamodb:::${local.dynamodb_name}",
    ]
  }
}
