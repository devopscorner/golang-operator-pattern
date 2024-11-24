# ==========================================================================
#  Module IAM User: iam-variable.tf
# --------------------------------------------------------------------------
#  Description:
#    IAM Variable
# --------------------------------------------------------------------------
#    - Group Developer
#    - Group Administrator
#    - Policy Developer
#    - Policy Administrator
#    - Role Developer
#    - Role Administrator
# ==========================================================================

# --------------------------------------------------------------------------
#  Group Name
# --------------------------------------------------------------------------
variable "group_dci_developer" {
  description = "Developer Group Name"
  type        = string
}

variable "group_dci_administrator" {
  description = "Administrator Group Name"
  type        = string
}

# --------------------------------------------------------------------------
#  Policy Name
# --------------------------------------------------------------------------
variable "policy_dci_developer" {
  description = "Developer Policy Name"
  type        = string
}

variable "policy_dci_administrator" {
  description = "Administrator Policy Name"
  type        = string
}

# --------------------------------------------------------------------------
#  TF-User Account
# --------------------------------------------------------------------------
variable "tf_user_executor" {
  description = "TF User Executor"
  type        = string
}

# --------------------------------------------------------------------------
#  User Team
# --------------------------------------------------------------------------
variable "dci_team_developer" {
  description = "DCI Developer Team Member"
  type        = list(any)
}

variable "dci_team_administrator" {
  description = "DCI Administrator Team Member"
  type        = list(any)
}
