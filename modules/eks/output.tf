# ==========================================================================
#  Module EKS: output.tf (Output Terraform)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - Return value eks module
# ==========================================================================

# --------------------------------------------------------------------------
#  EKS VPC
# --------------------------------------------------------------------------
output "eks_vpc_id" {
  value = data.aws_vpc.selected.id
}

# --------------------------------------------------------------------------
#  EKS Cluster Name
# --------------------------------------------------------------------------
output "eks_cluster_name" {
  value = aws_eks_cluster.aws_eks.name
}

# --------------------------------------------------------------------------
#  EKS Cluster Endpoint
# --------------------------------------------------------------------------
output "eks_cluster_endpoint" {
  value = aws_eks_cluster.aws_eks.endpoint
}

# --------------------------------------------------------------------------
#  EKS Cluster Certificate Authority
# --------------------------------------------------------------------------
output "eks_cluster_certificat_authority" {
  value = aws_eks_cluster.aws_eks.certificate_authority
}

# --------------------------------------------------------------------------
#  EKS Security Group
# --------------------------------------------------------------------------
output "eks_security_group" {
  value = aws_security_group.eks_sg.id
}

# --------------------------------------------------------------------------
#  EKS Config Map Auth
# --------------------------------------------------------------------------
output "config_map_aws_auth" {
  value = local.config_map_aws_auth
}

# --------------------------------------------------------------------------
#  EKS Kube Config
# --------------------------------------------------------------------------
output "kubeconfig" {
  value = local.kubeconfig
}