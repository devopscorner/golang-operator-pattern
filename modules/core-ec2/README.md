# Terraform Module Core Infrastructure for EC2

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.72 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws.destination"></a> [aws.destination](#provider\_aws.destination) | 5.76.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.ec2_ngw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route_table.igw_ec2_rt_public_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.igw_ec2_rt_public_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.igw_ec2_rt_public_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.nat_ec2_rt_private_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.nat_ec2_rt_private_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.nat_ec2_rt_private_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.igw_ec2_rt_public_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.igw_ec2_rt_public_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.igw_ec2_rt_public_1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.nat_ec2_rt_private_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.nat_ec2_rt_private_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.nat_ec2_rt_private_1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.ec2_private_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.ec2_private_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.ec2_private_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.ec2_public_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.ec2_public_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.ec2_public_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.infra_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_access_key"></a> [aws\_access\_key](#input\_aws\_access\_key) | The AWS Access Key | `string` | n/a | yes |
| <a name="input_aws_account_id_destination"></a> [aws\_account\_id\_destination](#input\_aws\_account\_id\_destination) | The AWS Account ID to deploy the Budget in | `string` | n/a | yes |
| <a name="input_aws_account_id_source"></a> [aws\_account\_id\_source](#input\_aws\_account\_id\_source) | The AWS Account ID management | `string` | n/a | yes |
| <a name="input_aws_account_profile_destination"></a> [aws\_account\_profile\_destination](#input\_aws\_account\_profile\_destination) | The AWS Profile to deploy the Budget in | `string` | n/a | yes |
| <a name="input_aws_account_profile_source"></a> [aws\_account\_profile\_source](#input\_aws\_account\_profile\_source) | The AWS Profile management | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region to deploy the VPC certificate in | `string` | n/a | yes |
| <a name="input_aws_secret_key"></a> [aws\_secret\_key](#input\_aws\_secret\_key) | The AWS Secret Key | `string` | n/a | yes |
| <a name="input_coreinfra"></a> [coreinfra](#input\_coreinfra) | Core Infrastrucre Name Prefix | `string` | `"dci-tf-mgmt"` | no |
| <a name="input_department"></a> [department](#input\_department) | Department Owner | `string` | n/a | yes |
| <a name="input_ec2_prefix"></a> [ec2\_prefix](#input\_ec2\_prefix) | EC2 Prefix Name | `string` | `"ec2"` | no |
| <a name="input_ec2_private_a"></a> [ec2\_private\_a](#input\_ec2\_private\_a) | Private Subnet for EC2 Zone A | `map(string)` | <pre>{<br/>  "default": "10.16.16.0/21",<br/>  "lab": "10.16.16.0/21",<br/>  "nonprod": "10.32.16.0/21",<br/>  "prod": "10.48.16.0/21",<br/>  "staging": "10.32.16.0/21"<br/>}</pre> | no |
| <a name="input_ec2_private_b"></a> [ec2\_private\_b](#input\_ec2\_private\_b) | Private Subnet for EC2 Zone B | `map(string)` | <pre>{<br/>  "default": "10.16.24.0/21",<br/>  "lab": "10.16.24.0/21",<br/>  "nonprod": "10.32.24.0/21",<br/>  "prod": "10.48.24.0/21",<br/>  "staging": "10.32.24.0/21"<br/>}</pre> | no |
| <a name="input_ec2_private_c"></a> [ec2\_private\_c](#input\_ec2\_private\_c) | Private Subnet for EC2 Zone C | `map(string)` | <pre>{<br/>  "default": "10.16.32.0/21",<br/>  "lab": "10.16.32.0/21",<br/>  "nonprod": "10.32.32.0/21",<br/>  "prod": "10.48.32.0/21",<br/>  "staging": "10.32.32.0/21"<br/>}</pre> | no |
| <a name="input_ec2_public_a"></a> [ec2\_public\_a](#input\_ec2\_public\_a) | Public Subnet for EC2 Zone A | `map(string)` | <pre>{<br/>  "default": "10.16.40.0/21",<br/>  "lab": "10.16.40.0/21",<br/>  "nonprod": "10.32.40.0/21",<br/>  "prod": "10.48.40.0/21",<br/>  "staging": "10.32.40.0/21"<br/>}</pre> | no |
| <a name="input_ec2_public_b"></a> [ec2\_public\_b](#input\_ec2\_public\_b) | Public Subnet for EC2 Zone B | `map(string)` | <pre>{<br/>  "default": "10.16.48.0/21",<br/>  "lab": "10.16.48.0/21",<br/>  "nonprod": "10.32.48.0/21",<br/>  "prod": "10.48.48.0/21",<br/>  "staging": "10.32.48.0/21"<br/>}</pre> | no |
| <a name="input_ec2_public_c"></a> [ec2\_public\_c](#input\_ec2\_public\_c) | Public Subnet for EC2 Zone C | `map(string)` | <pre>{<br/>  "default": "10.16.56.0/21",<br/>  "lab": "10.16.56.0/21",<br/>  "nonprod": "10.32.56.0/21",<br/>  "prod": "10.48.56.0/21",<br/>  "staging": "10.32.56.0/21"<br/>}</pre> | no |
| <a name="input_ec2_rt_prefix"></a> [ec2\_rt\_prefix](#input\_ec2\_rt\_prefix) | NAT EC2 Routing Table Prefix Name | `string` | `"ec2-rt"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Target Environment (tags) | `map(string)` | n/a | yes |
| <a name="input_igw_prefix"></a> [igw\_prefix](#input\_igw\_prefix) | IGW Prefix Name | `string` | `"igw"` | no |
| <a name="input_igw_rt_prefix"></a> [igw\_rt\_prefix](#input\_igw\_rt\_prefix) | IGW Routing Table Prefix Name | `string` | `"igw-rt"` | no |
| <a name="input_kms_env"></a> [kms\_env](#input\_kms\_env) | KMS Key Environment | `map(string)` | n/a | yes |
| <a name="input_kms_key"></a> [kms\_key](#input\_kms\_key) | KMS Key References | `map(string)` | n/a | yes |
| <a name="input_nat_ec2_prefix"></a> [nat\_ec2\_prefix](#input\_nat\_ec2\_prefix) | NAT EC2 Prefix Name | `string` | `"natgw_ec2"` | no |
| <a name="input_nat_prefix"></a> [nat\_prefix](#input\_nat\_prefix) | NAT Prefix Name | `string` | `"nat"` | no |
| <a name="input_nat_rt_prefix"></a> [nat\_rt\_prefix](#input\_nat\_rt\_prefix) | NAT Routing Table Prefix Name | `string` | `"nat-rt"` | no |
| <a name="input_peer_owner_id"></a> [peer\_owner\_id](#input\_peer\_owner\_id) | Core Infrastrucre VPC Peers Owner ID | `map(string)` | <pre>{<br/>  "default": "1234567890",<br/>  "lab": "1234567890",<br/>  "nonprod": "1234567890",<br/>  "prod": "0987654321",<br/>  "staging": "1234567890"<br/>}</pre> | no |
| <a name="input_propagating_vgws"></a> [propagating\_vgws](#input\_propagating\_vgws) | Core Infrastrucre VPC Gateway Propagating | `map(string)` | <pre>{<br/>  "default": "vgw-1234567890",<br/>  "lab": "vgw-1234567890",<br/>  "nonprod": "vgw-1234567890",<br/>  "prod": "vgw-0987654321",<br/>  "staging": "vgw-1234567890"<br/>}</pre> | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | Core Infrastrucre CIDR Block | `map(string)` | <pre>{<br/>  "default": "10.16.0.0/16",<br/>  "lab": "10.16.0.0/16",<br/>  "nonprod": "10.32.0.0/16",<br/>  "prod": "10.48.0.0/16",<br/>  "staging": "10.32.0.0/16"<br/>}</pre> | no |
| <a name="input_vpc_peer"></a> [vpc\_peer](#input\_vpc\_peer) | Core Infrastrucre VPC Peers ID | `map(string)` | <pre>{<br/>  "default": "vpc-1234567890",<br/>  "lab": "vpc-1234567890",<br/>  "nonprod": "vpc-1234567890",<br/>  "prod": "vpc-0987654321",<br/>  "staging": "vpc-1234567890"<br/>}</pre> | no |
| <a name="input_workspace_env"></a> [workspace\_env](#input\_workspace\_env) | Workspace Environment Selection | `map(string)` | n/a | yes |
| <a name="input_workspace_name"></a> [workspace\_name](#input\_workspace\_name) | Workspace Environment Name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_private_1a"></a> [ec2\_private\_1a](#output\_ec2\_private\_1a) | Private Subnet EC2 Zone A |
| <a name="output_ec2_private_1a_cidr"></a> [ec2\_private\_1a\_cidr](#output\_ec2\_private\_1a\_cidr) | Private Subnet EC2 CIDR Block of Zone A |
| <a name="output_ec2_private_1b"></a> [ec2\_private\_1b](#output\_ec2\_private\_1b) | Private Subnet EC2 Zone B |
| <a name="output_ec2_private_1b_cidr"></a> [ec2\_private\_1b\_cidr](#output\_ec2\_private\_1b\_cidr) | Private Subnet EC2 CIDR Block of Zone B |
| <a name="output_ec2_private_1c"></a> [ec2\_private\_1c](#output\_ec2\_private\_1c) | Private Subnet EC2 Zone C |
| <a name="output_ec2_private_1c_cidr"></a> [ec2\_private\_1c\_cidr](#output\_ec2\_private\_1c\_cidr) | Private Subnet EC2 CIDR Block of Zone C |
| <a name="output_ec2_public_1a"></a> [ec2\_public\_1a](#output\_ec2\_public\_1a) | Public Subnet EC2 Zone A |
| <a name="output_ec2_public_1a_cidr"></a> [ec2\_public\_1a\_cidr](#output\_ec2\_public\_1a\_cidr) | Public Subnet EC2 CIDR Block of Zone A |
| <a name="output_ec2_public_1b"></a> [ec2\_public\_1b](#output\_ec2\_public\_1b) | Public Subnet EC2 Zone B |
| <a name="output_ec2_public_1b_cidr"></a> [ec2\_public\_1b\_cidr](#output\_ec2\_public\_1b\_cidr) | Public Subnet EC2 CIDR Block of Zone B |
| <a name="output_ec2_public_1c"></a> [ec2\_public\_1c](#output\_ec2\_public\_1c) | Public Subnet EC2 Zone C |
| <a name="output_ec2_public_1c_cidr"></a> [ec2\_public\_1c\_cidr](#output\_ec2\_public\_1c\_cidr) | Public Subnet EC2 CIDR Block of Zone C |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | Security Group of VPC Id's |
| <a name="output_summary"></a> [summary](#output\_summary) | Summary Core Infrastructure Configuration |
| <a name="output_vpc_cidr"></a> [vpc\_cidr](#output\_vpc\_cidr) | VPC CIDR Block |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | VPC Identity |
| <a name="output_vpc_name"></a> [vpc\_name](#output\_vpc\_name) | VPC Name |
<!-- END_TF_DOCS -->