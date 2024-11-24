# ==========================================================================
#  111122223333 - IAM TFUser-Executor: provider.tf
# --------------------------------------------------------------------------
#  Description:
#    Provider Modules
# --------------------------------------------------------------------------
#    - Terraform Cli Version
#    - AWS Terraform Version
#    - AWS Region
#    - AWS Access Key
#    - AWS Secret Key
#    - AWS Account ID
# ==========================================================================

# --------------------------------------------------------------------------
#  Terraform AWS Version Compability & Remote State Path
# --------------------------------------------------------------------------
terraform {
  required_version = ">= 1.8.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.72"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">= 3.0"
    }

    random = ">= 2.0"
  }
}

# --------------------------------------------------------------------------
#  AWS Provider Properties
# --------------------------------------------------------------------------
provider "aws" {
  alias   = "destination"
  region  = var.aws_region
  profile = var.aws_account_profile_destination
  assume_role {
    role_arn     = "arn:aws:iam::${var.aws_account_id_destination}:role/Temp-TF-Central-Role_${var.aws_account_id_destination}"
    session_name = "${var.aws_account_profile_destination}-session"
  }
}
