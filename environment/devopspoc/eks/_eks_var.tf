# ==========================================================================
#  819037760369 - EKS: _eks_var.tf (Spesific Environment)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - Input Variable for Environment Variables
# ==========================================================================

# --------------------------------------------------------------------------
#  AWS Zone
# --------------------------------------------------------------------------
variable "aws_az" {
  type        = map(string)
  description = "AWS Zone Target Deployment"
  default = {
    lab     = "us-west-2a"
    nonprod = "us-west-2a"
    nonprod = "us-west-2a"
    prod    = "us-west-2a"
  }
}

# --------------------------------------------------------------------------
#  Bucket Name
# --------------------------------------------------------------------------
variable "bucket_name" {
  type        = string
  description = "Bucket Name"
  default     = "dci-eks"
}

# --------------------------------------------------------------------------
#  SSH public key
# --------------------------------------------------------------------------
variable "ssh_public_key" {
  type        = string
  description = "SSH Public Key"
  ## file:///Users/[username]/.ssh/id_rsa.pub
  default = ""
}

# --------------------------------------------------------------------------
#  VPN Id
# --------------------------------------------------------------------------
variable "vpn_infra" {
  type        = map(string)
  description = "VPN Infra"
  default = {
    lab     = "sg-1234567890"
    nonprod = "sg-1234567890"
    prod    = "sg-0987654321"
  }
}

# --------------------------------------------------------------------------
#  EC2 Instance
# --------------------------------------------------------------------------
variable "access_my_ip" {
  type        = string
  description = "Your IP Address"
  default     = "103.59.235.0/22"
}

# --------------------------------------------------------------------------
#  DNS (Public)
# --------------------------------------------------------------------------
variable "dns_zone" {
  type = map(string)
  default = {
    dev     = "Z03737373Q24J54C2PDT7"
    uat     = "Z03737373Q24J54C2PDT7"
    lab     = "Z03737373Q24J54C2PDT7"
    staging = "Z03737373Q24J54C2PDT7"
    nonprod = "Z03737373Q24J54C2PDT7"
    prod    = "Z03737373Q24J54C2PDT7"
  }
}

variable "dns_url" {
  type = map(string)
  default = {
    lab     = "awscb.id"
    staging = "awscb.id"
    nonprod = "awscb.id"
    prod    = "awscb.id"
  }
}

# --------------------------------------------------------------------------
#  EKS Cluster
# --------------------------------------------------------------------------
# PEM File from existing
variable "eks_cluster_name" {
  type        = string
  description = "default cluster name"
  default     = "devopspoc"
}


# --------------------------------------------------------------------------
#  SSH configurations
# --------------------------------------------------------------------------
# PEM File from existing
variable "ssh_key_pair" {
  type        = map(string)
  description = "default keyname"
  default = {
    lab     = "devopscorner-poc"
    staging = "devopscorner-poc"
    nonprod = "devopscorner-poc"
    prod    = "devopscorner-poc"
  }
}

variable "eks_name_env" {
  type = map(string)
  default = {
    lab     = "lab"
    staging = "staging"
    nonprod = "nonprod"
    prod    = "prod"
  }
}

variable "k8s_version" {
  type = map(string)
  default = {
    lab     = "1.30"
    staging = "1.30"
    nonprod = "1.30"
    prod    = "1.30"
  }
}

variable "nginx_version" {
  type    = string
  default = "4.8.4"
}

variable "linkerd_version" {
  type    = string
  default = "2.11.2"
}

variable "namespace" {
  description = "create namespace"
  type = list(object({
    name        = string
    labels      = map(string)
    annotations = map(string)
  }))
  default = [
    {
      name = "linkerd"
      labels = {
        "app.kubernetes.io/managed-by"         = "Helm",
        "config.linkerd.io/admission-webhooks" = "disabled",
        "kubernetes.io/metadata.name"          = "linkerd",
        "linkerd.io/control-plane-ns"          = "linkerd",
        "linkerd.io/is-control-plane"          = "true",
      }
      annotations = {
        "linkerd.io/inject"              = "disabled",
        "meta.helm.sh/release-name"      = "linkerd",
        "meta.helm.sh/release-namespace" = "linkerd",

      }
    }
    # {
    #   name = "linkerd-multicluster"
    #   labels = {
    #     "app.kubernetes.io/managed-by" = "Helm"
    #     "kubernetes.io/metadata.name" = "linkerd-multicluster"
    #     "linkerd.io/extension"        = "multicluster"
    #   }
    #   annotations = {
    #     "meta.helm.sh/release-name"      = "linkerd-multicluster",
    #     "meta.helm.sh/release-namespace" = "linkerd-multicluster",

    #   }
    # }
  ]
}

variable "default_tags" {
  type = map(any)
  default = {
    staging = {
      Environment     = "STG"
      Name            = "EKS-1.30"
      Department      = "DEVOPS"
      DepartmentGroup = "STG-DEVOPS"
      ResourceGroup   = "STG-EKS"
    }
    nonprod = {
      Environment     = "UAT"
      Name            = "EKS-1.30"
      Department      = "DEVOPS"
      DepartmentGroup = "UAT-DEVOPS"
      ResourceGroup   = "UAT-EKS"
    }
    prod = {
      Environment     = "PROD"
      Name            = "EKS-1.30"
      Department      = "DEVOPS"
      DepartmentGroup = "PROD-DEVOPS"
      ResourceGroup   = "PROD-EKS"
    }
  }
}
