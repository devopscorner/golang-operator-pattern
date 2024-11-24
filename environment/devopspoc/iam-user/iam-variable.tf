# ==========================================================================
#  111122223333 - IAM: iam-variable.tf
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
  default     = "dci-developer"
}

variable "group_dci_administrator" {
  description = "Administrator Group Name"
  type        = string
  default     = "dci-administrator"
}

# --------------------------------------------------------------------------
#  Policy Name
# --------------------------------------------------------------------------
variable "policy_dci_developer" {
  description = "Developer Policy Name"
  type        = string
  default     = "dci-developer-policy"
}

variable "policy_dci_administrator" {
  description = "Administrator Policy Name"
  type        = string
  default     = "dci-administrator-policy"
}

# --------------------------------------------------------------------------
#  TF-User Account
# --------------------------------------------------------------------------
variable "tf_user_executor" {
  description = "TF User Executor"
  type        = string
  default     = "TF-User-Executor-111122223333"
}

# --------------------------------------------------------------------------
#  User Team
# --------------------------------------------------------------------------
variable "dci_team_developer" {
  description = "DCI Developer Team Member"
  type        = list(any)
  default = [
    "dfdenni@devopscorner.id"
  ]
}

variable "dci_team_administrator" {
  description = "DCI Administrator Team Member"
  type        = list(any)
  default = [
    "dfdenni@devopscorner.id"
  ]
}
