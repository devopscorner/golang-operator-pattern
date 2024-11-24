# ==========================================================================
#  Module EKS: provider.tf
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
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
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
# provider "aws" {
#   alias   = "source"
#   region  = var.aws_region
#   profile = var.aws_account_profile_source
#   # access_key = var.aws_access_key
#   # secret_key = var.aws_secret_key
#   assume_role {
#     role_arn = "arn:aws:iam::${var.aws_account_id_source}:role/TF-Central-Role_${var.aws_account_id_source}"
#     session_name = "${var.aws_account_profile_source}-session"
#   }
# }

provider "aws" {
  alias   = "destination"
  region  = var.aws_region
  # profile = var.aws_account_profile_destination
  # access_key = var.aws_access_key
  # secret_key = var.aws_secret_key
  # assume_role {
  #   role_arn     = "arn:aws:iam::${var.aws_account_id_destination}:role/TF-Central-Role_${var.aws_account_id_destination}"
  #   session_name = "${var.aws_account_profile_destination}-session"
  # }
}
