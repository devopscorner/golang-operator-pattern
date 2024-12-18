# ==========================================================================
#  Module EKS: _eks_cluster.tf (Cluster Configuration)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - EKS Cluster Name
#    - EKS Version
#    - Cluster VPC Subnet
#    - Cluster Tagging
# ==========================================================================
# --------------------------------------------------------------------------
#  Resources Tags
# --------------------------------------------------------------------------
locals {
  resources_tags = {
    Name          = "${var.eks_name_env[local.env]}" == "prod" ? "${var.eks_cluster_name}" : "${var.eks_cluster_name}-${var.eks_name_env[local.env]}",
    ResourceGroup = "${var.environment[local.env]}-EKS-DCI"
  }
}

locals {
  use_k8s_version            = substr(var.k8s_version[local.env], 0, 3) == "1.1" ? "${var.k8s_version[local.env]}" : var.k8s_version[local.env]
  cluster_autoscaler_version = substr(local.use_k8s_version, 0, 4)
}

# --------------------------------------------------------------------------
#  EKS Output Config Auth & KubeConfig
# --------------------------------------------------------------------------
locals {
  config_map_aws_auth = <<CONFIGMAPAWSAUTH
apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapRoles: |
    - rolearn: ${aws_iam_role.eks_nodes.arn}
      username: system:node:{{EC2PrivateDNSName}}
      groups:
        - system:bootstrappers
        - system:nodes
    - rolearn: arn:aws:iam::${var.aws_account_id_destination}:role/dci-Lead
      username: devops
      groups:
        - engineering:ops
  mapUsers: |
    - userarn: arn:aws:iam::${var.aws_account_id_destination}:user/devops
      username: devops
      groups:
        - system:masters
CONFIGMAPAWSAUTH

  kubeconfig = <<KUBECONFIG
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: ${aws_eks_cluster.aws_eks.certificate_authority.0.data}
    server: ${aws_eks_cluster.aws_eks.endpoint}
  name: ${aws_eks_cluster.aws_eks.arn}
contexts:
- context:
    cluster: ${aws_eks_cluster.aws_eks.arn}
    user: ${aws_eks_cluster.aws_eks.arn}
  name: ${aws_eks_cluster.aws_eks.arn}
current-context: ${aws_eks_cluster.aws_eks.arn}
kind: Config
preferences: {}
users:
- name: ${aws_eks_cluster.aws_eks.arn}
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1beta1
      args:
        - "--region"
        - "${var.aws_region}"
        - "eks"
        - "get-token"
        - "--cluster-name"
        - "${var.eks_cluster_name}-${var.eks_name_env[local.env]}"
      command: aws
KUBECONFIG
}

# --------------------------------------------------------------------------
#  VPC EKS
# --------------------------------------------------------------------------
data "aws_vpc" "selected" {
  id = data.terraform_remote_state.core_state.outputs.vpc_id
}

resource "aws_eks_cluster" "aws_eks" {
  provider                  = aws.destination
  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  name                      = "${var.eks_cluster_name}-${var.eks_name_env[local.env]}"
  role_arn                  = aws_iam_role.eks_cluster.arn
  version                   = var.k8s_version[local.env]

  vpc_config {
    subnet_ids = [
      data.terraform_remote_state.core_state.outputs.eks_private_1a[0],
      data.terraform_remote_state.core_state.outputs.eks_private_1b[0],
      data.terraform_remote_state.core_state.outputs.eks_private_1c[0],
      data.terraform_remote_state.core_state.outputs.eks_public_1a[0],
      data.terraform_remote_state.core_state.outputs.eks_public_1b[0],
      data.terraform_remote_state.core_state.outputs.eks_public_1c[0]
    ]
  }

  tags = merge(
    local.tags,
    local.resources_tags,
    {
      "ClusterName"                                                                      = "${var.eks_cluster_name}-${var.eks_name_env[local.env]}",
      "k8s.io/cluster-autoscaler/${var.eks_cluster_name}-${var.eks_name_env[local.env]}" = "owned",
      "k8s.io/cluster-autoscaler/enabled"                                                = "true",
      "Terraform"                                                                        = "true"
    },
    {
      Environment     = "${upper(var.environment[local.env])}"
      Name            = "EKS-${var.k8s_version[local.env]}-${upper(var.eks_cluster_name)}-${upper(var.environment[local.env])}"
      Type            = "PRODUCTS"
      ProductName     = "EKS-DCI"
      ProductGroup    = "${var.eks_name_env[local.env]}" == "prod" ? "PROD-EKS-DCI" : "STG-EKS-DCI"
      Department      = "DEVOPS"
      DepartmentGroup = "${var.eks_name_env[local.env]}" == "prod" ? "PROD-DEVOPS" : "STG-DEVOPS"
      ResourceGroup   = "${var.eks_name_env[local.env]}" == "prod" ? "PROD-EKS-DCI" : "STG-EKS-DCI"
      Services        = "EKS"
    }
  )

  # provisioner "local-exec" {
  #   command = "kubectl apply -f  https://raw.githubusercontent.com/kubernetes/autoscaler/master/cluster-autoscaler/cloudprovider/aws/examples/cluster-autoscaler-autodiscover.yaml"
  # }

  # provisioner "local-exec" {
  #   command = <<-EOT
  #     kubectl -n kube-system patch deployment cluster-autoscaler --patch \
  #     '{"spec": { "template": { "metadata":{"annotations":{"cluster-autoscaler.kubernetes.io/safe-to-evict": "false"}}, "spec": { "containers": [{ "image": "k8s.gcr.io/autoscaling/cluster-autoscaler:v${local.cluster_autoscaler_version}.0", "name": "cluster-autoscaler", "resources": { "requests": {"cpu": "100m", "memory": "300Mi"}}, "command": [ "./cluster-autoscaler", "--v=4", "--stderrthreshold=info", "--cloud-provider=aws", "--skip-nodes-with-local-storage=false", "--expander=least-waste", "--node-group-auto-discovery=asg:tag=k8s.io/cluster-autoscaler/enabled,k8s.io/cluster-autoscaler/${aws_eks_cluster.aws_eks.name}", "--balance-similar-node-groups", "--skip-nodes-with-system-pods=false" ]}]}}}}'
  #   EOT
  # }
}

locals {
  tag_eks             = local.env == "staging" ? "DEV" : "${var.environment[local.env]}"
  eks-oidc-thumbprint = data.tls_certificate.cluster.certificates.0.sha1_fingerprint
}

data "tls_certificate" "cluster" {
  url = aws_eks_cluster.aws_eks.identity.0.oidc.0.issuer
}

data "aws_availability_zones" "available" {
  state = "available"
}

### OIDC config
resource "aws_iam_openid_connect_provider" "cluster" {
  provider        = aws.destination
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [local.eks-oidc-thumbprint]
  url             = aws_eks_cluster.aws_eks.identity.0.oidc.0.issuer
}
