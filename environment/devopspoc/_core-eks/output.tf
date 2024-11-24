# ==========================================================================
#  111122223333 - Core: output.tf
# --------------------------------------------------------------------------
#  Description
#    Output Terraform Value
# --------------------------------------------------------------------------
#    - VPC ID
#    - VPC CIDR
#    - VPC Name
#    - VPC Security Group ID
#    - Subnet ID EKS Private A
#    - Subnet ID EKS Private B
#    - Subnet ID EKS Private C
#    - Subnet CIDR Block EKS Private A
#    - Subnet CIDR Block EKS Private B
#    - Subnet CIDR Block EKS Private C
#    - Subnet ID EKS Public A
#    - Subnet ID EKS Public B
#    - Subnet ID EKS Public C
#    - Subnet CIDR Block EKS Public A
#    - Subnet CIDR Block EKS Public B
#    - Subnet CIDR Block EKS Public C
# ==========================================================================

# --------------------------------------------------------------------------
#  VPC Output
# --------------------------------------------------------------------------
output "vpc_id" {
  description = "VPC Identity"
  value       = module.core.vpc_id
}
output "vpc_cidr" {
  description = "VPC CIDR Block"
  value       = module.core.vpc_cidr
}
output "vpc_name" {
  description = "VPC Name"
  value       = module.core.vpc_name
}
output "security_group_id" {
  description = "Security Group of VPC Id's"
  value       = module.core.security_group_id
}

# --------------------------------------------------------------------------
#  EKS Output
# --------------------------------------------------------------------------
# EKS Private
output "eks_private_1a" {
  description = "Private Subnet EKS Zone A"
  value       = module.core.eks_private_1a
}
output "eks_private_1a_cidr" {
  description = "Private Subnet EKS CIDR Block of Zone A"
  value       = module.core.eks_private_1a_cidr
}
output "eks_private_1b" {
  description = "Private Subnet EKS Zone B"
  value       = module.core.eks_private_1b
}
output "eks_private_1b_cidr" {
  description = "Private Subnet EKS CIDR Block of Zone B"
  value       = module.core.eks_private_1b_cidr
}
output "eks_private_1c" {
  description = "Private Subnet EKS Zone C"
  value       = module.core.eks_private_1c
}
output "eks_private_1c_cidr" {
  description = "Private Subnet EKS CIDR Block of Zone C"
  value       = module.core.eks_private_1c_cidr
}

# EKS Public
output "eks_public_1a" {
  description = "Public Subnet EKS Zone A"
  value       = module.core.eks_public_1a
}
output "eks_public_1a_cidr" {
  description = "Public Subnet EKS CIDR Block of Zone A"
  value       = module.core.eks_public_1a_cidr
}
output "eks_public_1b" {
  description = "Public Subnet EKS Zone B"
  value       = module.core.eks_public_1b
}
output "eks_public_1b_cidr" {
  description = "Public Subnet EKS CIDR Block of Zone B"
  value       = module.core.eks_public_1b_cidr
}
output "eks_public_1c" {
  description = "Public Subnet EKS Zone C"
  value       = module.core.eks_public_1c
}
output "eks_public_1c_cidr" {
  description = "Public Subnet EKS CIDR Block of Zone C"
  value       = module.core.eks_public_1c_cidr
}

# --------------------------------------------------------------------------
#  Summary Output
# --------------------------------------------------------------------------
output "summary" {
  description = "Summary Core Infrastructure Configuration"
  value       = module.core.summary
}
