# ==========================================================================
#  Module EKS: remote_states.tf (Remote Terraform References)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - DynamoDB
#    - S3 Bucket
#    - Region
# ==========================================================================

# --------------------------------------------------------------------------
#  Use Existing Core Terraform Remote State
# --------------------------------------------------------------------------
data "terraform_remote_state" "core_state" {
  backend   = "s3"
  workspace = local.env

  config = {
    bucket  = "tf-state-111122223333-us-west-2"
    key     = "devopscorner/111122223333/core/terraform.tfstate"
    region  = var.aws_region
    profile = var.aws_account_profile_source
    # access_key = var.aws_access_key
    # secret_key = var.aws_secret_key
  }
}
