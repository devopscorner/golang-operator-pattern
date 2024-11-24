# Terraform EKS for 111122223333

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.72 |
| <a name="requirement_null"></a> [null](#requirement\_null) | ~> 3.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_core"></a> [core](#module\_core) | ../../../modules//core-eks | n/a |
| <a name="module_eks"></a> [eks](#module\_eks) | ../../../modules//eks | n/a |

## Resources

| Name | Type |
|------|------|
| [terraform_remote_state.core_state](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_my_ip"></a> [access\_my\_ip](#input\_access\_my\_ip) | Your IP Address | `string` | `"103.59.235.0/22"` | no |
| <a name="input_aws_access_key"></a> [aws\_access\_key](#input\_aws\_access\_key) | The AWS Access Key | `string` | `""` | no |
| <a name="input_aws_account_id_destination"></a> [aws\_account\_id\_destination](#input\_aws\_account\_id\_destination) | The AWS Account ID to deploy the Budget in | `string` | `"111122223333"` | no |
| <a name="input_aws_account_id_source"></a> [aws\_account\_id\_source](#input\_aws\_account\_id\_source) | The AWS Account ID management | `string` | `"111122223333"` | no |
| <a name="input_aws_account_profile_destination"></a> [aws\_account\_profile\_destination](#input\_aws\_account\_profile\_destination) | The AWS Profile to deploy the Budget in | `string` | `"DevOpsCorner-TF-User"` | no |
| <a name="input_aws_account_profile_source"></a> [aws\_account\_profile\_source](#input\_aws\_account\_profile\_source) | The AWS Profile management | `string` | `"DevOpsCorner-TF-User"` | no |
| <a name="input_aws_az"></a> [aws\_az](#input\_aws\_az) | AWS Zone Target Deployment | `map(string)` | <pre>{<br/>  "lab": "us-west-2a",<br/>  "nonprod": "us-west-2a",<br/>  "prod": "us-west-2a"<br/>}</pre> | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region to deploy the VPC certificate in | `string` | `"us-west-2"` | no |
| <a name="input_aws_secret_key"></a> [aws\_secret\_key](#input\_aws\_secret\_key) | The AWS Secret Key | `string` | `""` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Bucket Name | `string` | `"dci-eks"` | no |
| <a name="input_coreinfra"></a> [coreinfra](#input\_coreinfra) | Core Infrastrucre Name Prefix | `string` | `"dci-tf"` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | n/a | `map(any)` | <pre>{<br/>  "nonprod": {<br/>    "Department": "DEVOPS",<br/>    "DepartmentGroup": "UAT-DEVOPS",<br/>    "Environment": "UAT",<br/>    "Name": "EKS-1.30",<br/>    "ResourceGroup": "UAT-EKS"<br/>  },<br/>  "prod": {<br/>    "Department": "DEVOPS",<br/>    "DepartmentGroup": "PROD-DEVOPS",<br/>    "Environment": "PROD",<br/>    "Name": "EKS-1.30",<br/>    "ResourceGroup": "PROD-EKS"<br/>  },<br/>  "staging": {<br/>    "Department": "DEVOPS",<br/>    "DepartmentGroup": "STG-DEVOPS",<br/>    "Environment": "STG",<br/>    "Name": "EKS-1.30",<br/>    "ResourceGroup": "STG-EKS"<br/>  }<br/>}</pre> | no |
| <a name="input_department"></a> [department](#input\_department) | Department Owner | `string` | `"DEVOPS"` | no |
| <a name="input_dns_url"></a> [dns\_url](#input\_dns\_url) | n/a | `map(string)` | <pre>{<br/>  "lab": "awscb.id",<br/>  "nonprod": "awscb.id",<br/>  "prod": "awscb.id",<br/>  "staging": "awscb.id"<br/>}</pre> | no |
| <a name="input_dns_zone"></a> [dns\_zone](#input\_dns\_zone) | -------------------------------------------------------------------------- DNS (Public) -------------------------------------------------------------------------- | `map(string)` | <pre>{<br/>  "dev": "Z03737373Q24J54C2PDT7",<br/>  "lab": "Z03737373Q24J54C2PDT7",<br/>  "nonprod": "Z03737373Q24J54C2PDT7",<br/>  "prod": "Z03737373Q24J54C2PDT7",<br/>  "staging": "Z03737373Q24J54C2PDT7",<br/>  "uat": "Z03737373Q24J54C2PDT7"<br/>}</pre> | no |
| <a name="input_eks_cluster_name"></a> [eks\_cluster\_name](#input\_eks\_cluster\_name) | default cluster name | `string` | `"devopspoc"` | no |
| <a name="input_eks_name_env"></a> [eks\_name\_env](#input\_eks\_name\_env) | n/a | `map(string)` | <pre>{<br/>  "lab": "lab",<br/>  "nonprod": "nonprod",<br/>  "prod": "prod",<br/>  "staging": "staging"<br/>}</pre> | no |
| <a name="input_eks_prefix"></a> [eks\_prefix](#input\_eks\_prefix) | EKS Prefix Name | `string` | `"eks"` | no |
| <a name="input_eks_private_a"></a> [eks\_private\_a](#input\_eks\_private\_a) | Private Subnet for EKS Zone A | `map(string)` | <pre>{<br/>  "default": "10.16.64.0/21",<br/>  "lab": "10.16.64.0/21",<br/>  "prod": "10.48.64.0/21",<br/>  "staging": "10.32.64.0/21"<br/>}</pre> | no |
| <a name="input_eks_private_b"></a> [eks\_private\_b](#input\_eks\_private\_b) | Private Subnet for EKS Zone B | `map(string)` | <pre>{<br/>  "default": "10.16.72.0/21",<br/>  "lab": "10.16.72.0/21",<br/>  "prod": "10.48.72.0/21",<br/>  "staging": "10.32.72.0/21"<br/>}</pre> | no |
| <a name="input_eks_private_c"></a> [eks\_private\_c](#input\_eks\_private\_c) | Private Subnet for EKS Zone C | `map(string)` | <pre>{<br/>  "default": "10.16.80.0/21",<br/>  "lab": "10.16.80.0/21",<br/>  "prod": "10.48.80.0/21",<br/>  "staging": "10.32.80.0/21"<br/>}</pre> | no |
| <a name="input_eks_public_a"></a> [eks\_public\_a](#input\_eks\_public\_a) | Public Subnet for EKS Zone A | `map(string)` | <pre>{<br/>  "default": "10.16.88.0/21",<br/>  "lab": "10.16.88.0/21",<br/>  "prod": "10.48.88.0/21",<br/>  "staging": "10.32.88.0/21"<br/>}</pre> | no |
| <a name="input_eks_public_b"></a> [eks\_public\_b](#input\_eks\_public\_b) | Public Subnet for EKS Zone B | `map(string)` | <pre>{<br/>  "default": "10.16.96.0/21",<br/>  "lab": "10.16.96.0/21",<br/>  "prod": "10.48.96.0/21",<br/>  "staging": "10.32.96.0/21"<br/>}</pre> | no |
| <a name="input_eks_public_c"></a> [eks\_public\_c](#input\_eks\_public\_c) | Public Subnet for EKS Zone C | `map(string)` | <pre>{<br/>  "default": "10.16.104.0/21",<br/>  "lab": "10.16.104.0/21",<br/>  "prod": "10.48.104.0/21",<br/>  "staging": "10.32.104.0/21"<br/>}</pre> | no |
| <a name="input_eks_rt_prefix"></a> [eks\_rt\_prefix](#input\_eks\_rt\_prefix) | NAT EKS Routing Table Prefix Name | `string` | `"eks-rt"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Target Environment (tags) | `map(string)` | <pre>{<br/>  "default": "DEF",<br/>  "lab": "RND",<br/>  "nonprod": "NONPROD",<br/>  "prod": "PROD",<br/>  "staging": "STG"<br/>}</pre> | no |
| <a name="input_igw_prefix"></a> [igw\_prefix](#input\_igw\_prefix) | IGW Prefix Name | `string` | `"igw"` | no |
| <a name="input_igw_rt_prefix"></a> [igw\_rt\_prefix](#input\_igw\_rt\_prefix) | IGW Routing Table Prefix Name | `string` | `"igw-rt"` | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | n/a | `map(string)` | <pre>{<br/>  "lab": "1.30",<br/>  "nonprod": "1.30",<br/>  "prod": "1.30",<br/>  "staging": "1.30"<br/>}</pre> | no |
| <a name="input_kms_env"></a> [kms\_env](#input\_kms\_env) | KMS Key Environment | `map(string)` | <pre>{<br/>  "lab": "RnD",<br/>  "nonprod": "NonProduction",<br/>  "prod": "Production",<br/>  "staging": "Staging"<br/>}</pre> | no |
| <a name="input_kms_key"></a> [kms\_key](#input\_kms\_key) | KMS Key References | `map(string)` | <pre>{<br/>  "default": "arn:aws:kms:us-west-2:111122223333:key/HASH_KEY_NUMBER",<br/>  "lab": "arn:aws:kms:us-west-2:111122223333:key/HASH_KEY_NUMBER",<br/>  "prod": "arn:aws:kms:us-west-2:111122223333:key/HASH_KEY_NUMBER",<br/>  "staging": "arn:aws:kms:us-west-2:111122223333:key/HASH_KEY_NUMBER"<br/>}</pre> | no |
| <a name="input_linkerd_version"></a> [linkerd\_version](#input\_linkerd\_version) | n/a | `string` | `"2.11.2"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | create namespace | <pre>list(object({<br/>    name        = string<br/>    labels      = map(string)<br/>    annotations = map(string)<br/>  }))</pre> | <pre>[<br/>  {<br/>    "annotations": {<br/>      "linkerd.io/inject": "disabled",<br/>      "meta.helm.sh/release-name": "linkerd",<br/>      "meta.helm.sh/release-namespace": "linkerd"<br/>    },<br/>    "labels": {<br/>      "app.kubernetes.io/managed-by": "Helm",<br/>      "config.linkerd.io/admission-webhooks": "disabled",<br/>      "kubernetes.io/metadata.name": "linkerd",<br/>      "linkerd.io/control-plane-ns": "linkerd",<br/>      "linkerd.io/is-control-plane": "true"<br/>    },<br/>    "name": "linkerd"<br/>  }<br/>]</pre> | no |
| <a name="input_nat_eks_prefix"></a> [nat\_eks\_prefix](#input\_nat\_eks\_prefix) | NAT EKS Prefix Name | `string` | `"natgw_eks"` | no |
| <a name="input_nat_prefix"></a> [nat\_prefix](#input\_nat\_prefix) | NAT Prefix Name | `string` | `"nat"` | no |
| <a name="input_nat_rt_prefix"></a> [nat\_rt\_prefix](#input\_nat\_rt\_prefix) | NAT Routing Table Prefix Name | `string` | `"nat-rt"` | no |
| <a name="input_nginx_version"></a> [nginx\_version](#input\_nginx\_version) | n/a | `string` | `"4.8.4"` | no |
| <a name="input_peer_owner_id"></a> [peer\_owner\_id](#input\_peer\_owner\_id) | Core Infrastrucre VPC Peers Owner ID | `map(string)` | <pre>{<br/>  "default": "1234567890",<br/>  "lab": "1234567890",<br/>  "nonprod": "1234567890",<br/>  "prod": "0987654321",<br/>  "staging": "1234567890"<br/>}</pre> | no |
| <a name="input_propagating_vgws"></a> [propagating\_vgws](#input\_propagating\_vgws) | Core Infrastrucre VPC Gateway Propagating | `map(string)` | <pre>{<br/>  "default": "vgw-1234567890",<br/>  "lab": "vgw-1234567890",<br/>  "nonprod": "vgw-1234567890",<br/>  "prod": "vgw-0987654321",<br/>  "staging": "vgw-1234567890"<br/>}</pre> | no |
| <a name="input_ssh_key_pair"></a> [ssh\_key\_pair](#input\_ssh\_key\_pair) | default keyname | `map(string)` | <pre>{<br/>  "lab": "devopscorner-poc",<br/>  "nonprod": "devopscorner-poc",<br/>  "prod": "devopscorner-poc",<br/>  "staging": "devopscorner-poc"<br/>}</pre> | no |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | SSH Public Key | `string` | `""` | no |
| <a name="input_tfstate_bucket"></a> [tfstate\_bucket](#input\_tfstate\_bucket) | Name of bucket to store tfstate | `string` | `"tf-state-111122223333-us-west-2"` | no |
| <a name="input_tfstate_dynamodb_table"></a> [tfstate\_dynamodb\_table](#input\_tfstate\_dynamodb\_table) | Name of dynamodb table to store tfstate | `string` | `"ddb-tf-state-111122223333-us-west-2"` | no |
| <a name="input_tfstate_encrypt"></a> [tfstate\_encrypt](#input\_tfstate\_encrypt) | Name of bucket to store tfstate | `bool` | `true` | no |
| <a name="input_tfstate_path"></a> [tfstate\_path](#input\_tfstate\_path) | Path .tfstate in Bucket | `string` | `"tfstate/terraform.tfstate"` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | Core Infrastrucre CIDR Block | `map(string)` | <pre>{<br/>  "default": "10.16.0.0/16",<br/>  "lab": "10.16.0.0/16",<br/>  "nonprod": "10.32.0.0/16",<br/>  "prod": "10.48.0.0/16",<br/>  "staging": "10.32.0.0/16"<br/>}</pre> | no |
| <a name="input_vpc_peer"></a> [vpc\_peer](#input\_vpc\_peer) | Core Infrastrucre VPC Peers ID | `map(string)` | <pre>{<br/>  "default": "vpc-1234567890",<br/>  "lab": "vpc-1234567890",<br/>  "nonprod": "vpc-1234567890",<br/>  "prod": "vpc-0987654321",<br/>  "staging": "vpc-1234567890"<br/>}</pre> | no |
| <a name="input_vpn_infra"></a> [vpn\_infra](#input\_vpn\_infra) | VPN Infra | `map(string)` | <pre>{<br/>  "lab": "sg-1234567890",<br/>  "nonprod": "sg-1234567890",<br/>  "prod": "sg-0987654321"<br/>}</pre> | no |
| <a name="input_workspace_env"></a> [workspace\_env](#input\_workspace\_env) | Workspace Environment Selection | `map(string)` | <pre>{<br/>  "default": "default",<br/>  "lab": "rnd",<br/>  "nonprod": "nonprod",<br/>  "prod": "prod",<br/>  "staging": "staging"<br/>}</pre> | no |
| <a name="input_workspace_name"></a> [workspace\_name](#input\_workspace\_name) | Workspace Environment Name | `string` | `"default"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_config_map_aws_auth"></a> [config\_map\_aws\_auth](#output\_config\_map\_aws\_auth) | -------------------------------------------------------------------------- EKS Config Map Auth -------------------------------------------------------------------------- |
| <a name="output_eks_cluster_certificat_authority"></a> [eks\_cluster\_certificat\_authority](#output\_eks\_cluster\_certificat\_authority) | -------------------------------------------------------------------------- EKS Cluster Certificate Authority -------------------------------------------------------------------------- |
| <a name="output_eks_cluster_endpoint"></a> [eks\_cluster\_endpoint](#output\_eks\_cluster\_endpoint) | -------------------------------------------------------------------------- EKS Cluster Endpoint -------------------------------------------------------------------------- |
| <a name="output_eks_cluster_name"></a> [eks\_cluster\_name](#output\_eks\_cluster\_name) | -------------------------------------------------------------------------- EKS Cluster Name -------------------------------------------------------------------------- |
| <a name="output_eks_security_group"></a> [eks\_security\_group](#output\_eks\_security\_group) | -------------------------------------------------------------------------- EKS Security Group -------------------------------------------------------------------------- |
| <a name="output_eks_vpc_id"></a> [eks\_vpc\_id](#output\_eks\_vpc\_id) | -------------------------------------------------------------------------- EKS VPC -------------------------------------------------------------------------- |
| <a name="output_kubeconfig"></a> [kubeconfig](#output\_kubeconfig) | -------------------------------------------------------------------------- EKS Kube Config -------------------------------------------------------------------------- |
<!-- END_TF_DOCS -->