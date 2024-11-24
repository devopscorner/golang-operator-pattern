# ==========================================================================
#  Module EKS: _eks_var.tf (Spesific Environment)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - Input Variable for Environment Variables
# ==========================================================================

# --------------------------------------------------------------------------
#  AWS Zone
# --------------------------------------------------------------------------
variable "aws_az" {
  description = "AWS Zone Target Deployment"
  type        = map(string)
}

# --------------------------------------------------------------------------
#  Bucket Name
# --------------------------------------------------------------------------
variable "bucket_name" {
  description = "Bucket Name"
  type        = string
}

# --------------------------------------------------------------------------
#  SSH public key
# --------------------------------------------------------------------------
variable "ssh_public_key" {
  description = "SSH Public Key"
  type        = string
  ## file:///Users/[username]/.ssh/id_rsa.pub
}

# --------------------------------------------------------------------------
#  VPN Id
# --------------------------------------------------------------------------
variable "vpn_infra" {
  description = "VPN Infra"
  type        = map(string)
}

# --------------------------------------------------------------------------
#  EC2 Instance
# --------------------------------------------------------------------------
variable "access_my_ip" {
  description = "Your IP Address"
  type        = string
}

# --------------------------------------------------------------------------
#  DNS (Public)
# --------------------------------------------------------------------------
variable "dns_zone" {
  description = "DNS Zone EKS"
  type = map(string)
}

variable "dns_url" {
  description = "DNS URL EKS"
  type = map(string)
}

# --------------------------------------------------------------------------
#  EKS Cluster
# --------------------------------------------------------------------------
# PEM File from existing
variable "eks_cluster_name" {
  description = "Default cluster name"
  type        = string
}


# --------------------------------------------------------------------------
#  SSH configurations
# --------------------------------------------------------------------------
# PEM File from existing
variable "ssh_key_pair" {
  description = "Default keyname"
  type        = map(string)
}

variable "eks_name_env" {
  description = "Default EKS environment name"
  type = map(string)
  default = {
    lab     = "lab"
    staging = "staging"
    prod    = "prod"
  }
}

variable "k8s_version" {
  description = "Default EKS version"
  type = map(string)
  default = {
    lab     = "1.30"
    staging = "1.30"
    prod    = "1.30"
  }
}
