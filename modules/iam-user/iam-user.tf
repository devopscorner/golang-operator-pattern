# ==========================================================================
#  Module IAM User: iam-user.tf
# --------------------------------------------------------------------------
#  Description:
#    IAM List Account
# --------------------------------------------------------------------------
#    - List Administrator Account
#    - List Developer Account
# ==========================================================================

# --------------------------------------------------------------------------
#  IAM User
# --------------------------------------------------------------------------

locals {
  iam_dci_tags = {
    "Team" = "DCI"
  }

  dci_team_developer       = var.dci_team_developer
  dci_team_administrator   = var.dci_team_administrator
}

# --------------------------------------------------------------------------
#  DCI Developer Team
# --------------------------------------------------------------------------
resource "aws_iam_user" "dci_developer" {
  provider = aws.destination

  ## Group: Developer
  for_each = toset(
    local.dci_team_developer
  )

  name = each.key

  tags = merge(
    local.tags,
    local.iam_dci_tags,
    {
      Name          = "${lower(each.key)}"
      ResourceGroup = "IAM-DCI"
      Services      = "IAM"
    }
  )
}

# --------------------------------------------------------------------------
#  DCI Administrator Team
# --------------------------------------------------------------------------
resource "aws_iam_user" "dci_admin" {
  provider = aws.destination

  ## Group: Administrator
  for_each = toset(
    local.dci_team_administrator
  )

  name = each.key

  tags = merge(
    local.tags,
    local.iam_dci_tags,
    {
      Name          = "${lower(each.key)}"
      ResourceGroup = "IAM-DCI"
      Services      = "IAM"
    }
  )
}
