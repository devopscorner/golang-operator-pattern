# ==========================================================================
#  111122223333 - IAM TFUser-Executor: variable.tf
# --------------------------------------------------------------------------
#  Description:
#    Global Variable
# --------------------------------------------------------------------------
#    - KMS Key ID
#    - KMS Key Environment
#    - AWS Region
#    - AWS Account ID
#    - AWS Account Profile
#    - Workspace ID
#    - Workspace Environment
#    - Global Tags
# ==========================================================================

# --------------------------------------------------------------------------
#  KMS Key & Environment
# --------------------------------------------------------------------------
variable "kms_key" {
  type        = map(string)
  description = "KMS Key References"
  default = {
    default = "arn:aws:kms:us-west-2:111122223333:key/HASH_KEY_NUMBER"
    lab     = "arn:aws:kms:us-west-2:111122223333:key/HASH_KEY_NUMBER"
    staging = "arn:aws:kms:us-west-2:111122223333:key/HASH_KEY_NUMBER"
    prod    = "arn:aws:kms:us-west-2:111122223333:key/HASH_KEY_NUMBER"
  }
}

variable "kms_env" {
  type        = map(string)
  description = "KMS Key Environment"
  default = {
    lab     = "RnD"
    staging = "Staging"
    nonprod = "NonProduction"
    prod    = "Production"
  }
}

# --------------------------------------------------------------------------
#  AWS
# --------------------------------------------------------------------------
variable "aws_region" {
  description = "The AWS region"
  type        = string
  default     = "us-west-2"
}

variable "aws_account_id_source" {
  description = "The AWS Account ID management"
  type        = string
  default     = "111122223333"
}

variable "aws_account_id_destination" {
  description = "The AWS Account ID to deploy the Budget in"
  type        = string
  default     = "111122223333"
}

variable "aws_account_profile_source" {
  description = "The AWS Profile management"
  type        = string
  default     = "DevOpsCorner-TF-User"
}

variable "aws_account_profile_destination" {
  description = "The AWS Profile to deploy the Budget in"
  type        = string
  default     = "DevOpsCorner-TF-User"
}

variable "aws_access_key" {
  description = "The AWS Access Key"
  type        = string
  default     = ""
}

variable "aws_secret_key" {
  description = "The AWS Secret Key"
  type        = string
  default     = ""
}

# --------------------------------------------------------------------------
#  Workspace
# --------------------------------------------------------------------------
variable "workspace_name" {
  description = "Workspace Environment Name"
  type        = string
  default     = "default"
}

variable "workspace_env" {
  description = "Workspace Environment Selection"
  type        = map(string)
  default = {
    default = "default"
    lab     = "rnd"
    staging = "staging"
    nonprod = "nonprod"
    prod    = "prod"
  }
}

# --------------------------------------------------------------------------
#  Environment Resources Tags
# --------------------------------------------------------------------------
variable "environment" {
  description = "Target Environment (tags)"
  type        = map(string)
  default = {
    default = "DEF"
    lab     = "RND"
    staging = "STG"
    nonprod = "NONPROD"
    prod    = "PROD"
  }
}

# --------------------------------------------------------------------------
#  Department Tags
# --------------------------------------------------------------------------
variable "department" {
  description = "Department Owner"
  type        = string
  default     = "DEVOPS"
}
