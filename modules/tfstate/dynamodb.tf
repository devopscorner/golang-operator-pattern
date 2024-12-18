# ==========================================================================
#  Module TFState: dynamodb.tf
# --------------------------------------------------------------------------
#  Description:
#    Using Dynamodb for Storing TFState Index
# --------------------------------------------------------------------------
#    - Resources Tags
#    - DynamoDB Configuration
# ==========================================================================

# --------------------------------------------------------------------------
#  Resources Tags
# --------------------------------------------------------------------------
locals {
  dynamodb_tags = {
    "Name"          = var.tfstate_dynamodb_table,
    "ResourceGroup" = "${var.environment[local.env]}-DYN-TFSTATE"
  }
}

# --------------------------------------------------------------------------
# DynamoDB (Object)
# --------------------------------------------------------------------------
locals {
  dynamodb_name = var.tfstate_dynamodb_table
}

# --------------------------------------------------------------------------
# DynamoDB
# --------------------------------------------------------------------------
module "dynamodb" {
  source = "github.com/terraform-aws-modules/terraform-aws-dynamodb-table.git?ref=v4.2.0"

  name                        = var.tfstate_dynamodb_table
  hash_key                    = "LockID"
  billing_mode                = "PROVISIONED"
  read_capacity               = 5
  write_capacity              = 5
  autoscaling_enabled         = true
  deletion_protection_enabled = true

  autoscaling_read = {
    scale_in_cooldown  = 50
    scale_out_cooldown = 40
    target_value       = 70
    max_capacity       = 10
  }

  autoscaling_write = {
    scale_in_cooldown  = 50
    scale_out_cooldown = 40
    target_value       = 70
    max_capacity       = 10
  }

  autoscaling_indexes = {
    LockIDIndex = {
      read_max_capacity  = 30
      read_min_capacity  = 10
      write_max_capacity = 30
      write_min_capacity = 10
    }
  }

  attributes = [
    {
      name = "LockID"
      type = "S"
    }
  ]

  global_secondary_indexes = [
    {
      name               = "LockIDIndex"
      hash_key           = "LockID"
      projection_type    = "INCLUDE"
      non_key_attributes = ["id"]
      write_capacity     = 10
      read_capacity      = 10
    }
  ]

  tags = merge(local.tags, local.dynamodb_tags)
}
