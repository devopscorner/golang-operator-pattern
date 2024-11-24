# ==========================================================================
#  Module Budget: _budget_var.tf
# --------------------------------------------------------------------------
#  Description:
#    Budget Variable
# --------------------------------------------------------------------------
#    - Monthly Forcasted Name
#    - Monthly Forcasted Type
#    - Monthly Forcasted Limit Amount
#    - Monthly Forcasted Limit Unit
#    - Monthly Forcasted Time Unit
#    - Monthly Forcasted Time Period Start
#    - Monthly Budget Name
#    - Monthly Budget Type
#    - Monthly Budget Limit Amount
#    - Monthly Budget Limit Unit
#    - Monthly Budget Time Unit
#    - Monthly Budget Time Period Start
# ==========================================================================

# --------------------------------------------------------------------------
#  Budget
# --------------------------------------------------------------------------
###  Monthly Forcasted ###
variable "monthly_forcasted_name" {
  description = "Monthly Forcasted Name"
  type        = string
  default     = "monthly_forcasted_100"
}

variable "monthly_forcasted_limit_amount" {
  description = "Monthly Forcasted Limit Amount"
  type        = string
  default     = "100"
}

variable "monthly_forcasted_limit_unit" {
  description = "Monthly Forcasted Limit Unit"
  type        = string
  default     = "USD"
}

variable "monthly_forcasted_notification_subscriber" {
  description = "Monthly Forcasted Notification Subscriber Email Address"
  type        = string
  default     = "support@devopscorner.id"
}

###  Monthly Budget Billing ###
variable "monthly_budget_name" {
  description = "Monthly Budget Name"
  type        = string
  default     = "monthly_budget_150"
}

variable "monthly_budget_limit_amount" {
  description = "Monthly Budget Limit Amount"
  type        = string
  default     = "150"
}

variable "monthly_budget_limit_unit" {
  description = "Monthly Budget Limit Unit"
  type        = string
  default     = "USD"
}

variable "monthly_budget_notification_subscriber" {
  description = "Monthly Budget Notification Subscriber Email Address"
  type        = string
  default     = "support@devopscorner.id"
}