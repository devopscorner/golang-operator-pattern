# ==========================================================================
#  Module Core: core-vars.tf
# --------------------------------------------------------------------------
#  Description
#    Core Infrastructure Spesific Variable
# --------------------------------------------------------------------------
#    - Core Prefix Name
#    - Core VPC CIDR Block
#    - Core VPC Peer
#    - Core VPC Peer Owner ID
#    - Core VPC Gateway Propagating
#    - Core VPC CIDR Secondary Zone A
#    - Core VPC CIDR Secondary Zone B
#    - Core Prefix EC2
#    - Core Prefix EKS
#    - Core Prefix NAT EC2
#    - Core Prefix NAT EKS
# ==========================================================================

# --------------------------------------------------------------------------
#  Prefix Infra
# --------------------------------------------------------------------------
variable "coreinfra" {
  description = "Core Infrastrucre Name Prefix"
  type        = string
}

# --------------------------------------------------------------------------
#  VPC
# --------------------------------------------------------------------------
variable "vpc_cidr" {
  description = "Core Infrastrucre CIDR Block"
  type        = map(string)
}

variable "vpc_peer" {
  description = "Core Infrastrucre VPC Peers ID"
  type        = map(string)
}

variable "peer_owner_id" {
  description = "Core Infrastrucre VPC Peers Owner ID"
  type        = map(string)
}

variable "propagating_vgws" {
  description = "Core Infrastrucre VPC Gateway Propagating"
  type        = map(string)
}

# variable "vpc_cidr_secondary_a" {
#   description = "Core Infrastrucre VPC CIDR Secondary Zone A"
#   type = map(string)
# }

# variable "vpc_cidr_secondary_b" {
#   description = "Core Infrastrucre VPC CIDR Secondary Zone B"
#   type = map(string)
# }

# --------------------------------------------------------------------------
#  Infra Prefix
# --------------------------------------------------------------------------
# EC2 Prefix
variable "ec2_prefix" {
  description = "EC2 Prefix Name"
  type        = string
}

# EKS Prefix
variable "eks_prefix" {
  description = "EKS Prefix Name"
  type        = string
}

# --------------------------------------------------------------------------
#  NAT Gateway
# --------------------------------------------------------------------------
# NAT EC2 Prefix
variable "nat_ec2_prefix" {
  description = "NAT EC2 Prefix Name"
  type        = string
}

# NAT EKS Prefix
variable "nat_eks_prefix" {
  description = "NAT EKS Prefix Name"
  type        = string
}

# --------------------------------------------------------------------------
#  Subnet
# --------------------------------------------------------------------------
## EC2 Private
variable "ec2_private_a" {
  description = "Private Subnet for EC2 Zone A"
  type        = map(string)
}

variable "ec2_private_b" {
  description = "Private Subnet for EC2 Zone B"
  type        = map(string)
}

variable "ec2_private_c" {
  description = "Private Subnet for EC2 Zone C"
  type        = map(string)
}

## EC2 Public
variable "ec2_public_a" {
  description = "Public Subnet for EC2 Zone A"
  type        = map(string)
}

variable "ec2_public_b" {
  description = "Public Subnet for EC2 Zone B"
  type        = map(string)
}

variable "ec2_public_c" {
  description = "Public Subnet for EC2 Zone C"
  type        = map(string)
}

## EKS Private
variable "eks_private_a" {
  description = "Private Subnet for EKS Zone A"
  type        = map(string)
}

variable "eks_private_b" {
  description = "Private Subnet for EKS Zone B"
  type        = map(string)
}

variable "eks_private_c" {
  description = "Private Subnet for EKS Zone C"
  type        = map(string)
}

## EKS Public
variable "eks_public_a" {
  description = "Public Subnet for EKS Zone A"
  type        = map(string)
}

variable "eks_public_b" {
  description = "Public Subnet for EKS Zone B"
  type        = map(string)
}

variable "eks_public_c" {
  description = "Public Subnet for EKS Zone C"
  type        = map(string)
}

# --------------------------------------------------------------------------
#  Routing Table
# --------------------------------------------------------------------------
# EC2 RT Prefix
variable "ec2_rt_prefix" {
  description = "NAT EC2 Routing Table Prefix Name"
  type        = string
}

# EKS RT Prefix
variable "eks_rt_prefix" {
  description = "NAT EKS Routing Table Prefix Name"
  type        = string
}

# --------------------------------------------------------------------------
#  Internet Gateway
# --------------------------------------------------------------------------
# IGW Prefix
variable "igw_prefix" {
  description = "IGW Prefix Name"
  type        = string
}

# IGW RT Prefix
variable "igw_rt_prefix" {
  description = "IGW Routing Table Prefix Name"
  type        = string
}

# --------------------------------------------------------------------------
#  NAT Gateway
# --------------------------------------------------------------------------
# NAT Prefix
variable "nat_prefix" {
  description = "NAT Prefix Name"
  type        = string
}

# NAT RT Prefix
variable "nat_rt_prefix" {
  description = "NAT Routing Table Prefix Name"
  type        = string
}
