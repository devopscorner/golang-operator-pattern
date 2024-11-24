# Terraform IAM User for 111122223333

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.72 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam-user"></a> [iam-user](#module\_iam-user) | ../../../modules//iam-user | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_access_key"></a> [aws\_access\_key](#input\_aws\_access\_key) | The AWS Access Key | `string` | `""` | no |
| <a name="input_aws_account_id_destination"></a> [aws\_account\_id\_destination](#input\_aws\_account\_id\_destination) | The AWS Account ID to deploy the Budget in | `string` | `"111122223333"` | no |
| <a name="input_aws_account_id_source"></a> [aws\_account\_id\_source](#input\_aws\_account\_id\_source) | The AWS Account ID management | `string` | `"111122223333"` | no |
| <a name="input_aws_account_profile_destination"></a> [aws\_account\_profile\_destination](#input\_aws\_account\_profile\_destination) | The AWS Profile to deploy the Budget in | `string` | `"DevOpsCorner-TF-User"` | no |
| <a name="input_aws_account_profile_source"></a> [aws\_account\_profile\_source](#input\_aws\_account\_profile\_source) | The AWS Profile management | `string` | `"DevOpsCorner-TF-User"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region | `string` | `"us-west-2"` | no |
| <a name="input_aws_secret_key"></a> [aws\_secret\_key](#input\_aws\_secret\_key) | The AWS Secret Key | `string` | `""` | no |
| <a name="input_dci_team_administrator"></a> [dci\_team\_administrator](#input\_dci\_team\_administrator) | DCI Administrator Team Member | `list(any)` | <pre>[<br/>  "dfdenni@devopscorner.id"<br/>]</pre> | no |
| <a name="input_dci_team_developer"></a> [dci\_team\_developer](#input\_dci\_team\_developer) | DCI Developer Team Member | `list(any)` | <pre>[<br/>  "dfdenni@devopscorner.id"<br/>]</pre> | no |
| <a name="input_department"></a> [department](#input\_department) | Department Owner | `string` | `"DEVOPS"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Target Environment (tags) | `map(string)` | <pre>{<br/>  "default": "DEF",<br/>  "lab": "RND",<br/>  "prod": "PROD",<br/>  "staging": "STG"<br/>}</pre> | no |
| <a name="input_group_dci_administrator"></a> [group\_dci\_administrator](#input\_group\_dci\_administrator) | Administrator Group Name | `string` | `"dci-administrator"` | no |
| <a name="input_group_dci_developer"></a> [group\_dci\_developer](#input\_group\_dci\_developer) | Developer Group Name | `string` | `"dci-developer"` | no |
| <a name="input_kms_env"></a> [kms\_env](#input\_kms\_env) | KMS Key Environment | `map(string)` | <pre>{<br/>  "lab": "RnD",<br/>  "prod": "Production",<br/>  "staging": "Staging"<br/>}</pre> | no |
| <a name="input_kms_key"></a> [kms\_key](#input\_kms\_key) | KMS Key References | `map(string)` | <pre>{<br/>  "default": "arn:aws:kms:us-west-2:111122223333:key/HASH_KEY_NUMBER",<br/>  "lab": "arn:aws:kms:us-west-2:111122223333:key/HASH_KEY_NUMBER",<br/>  "prod": "arn:aws:kms:us-west-2:111122223333:key/HASH_KEY_NUMBER",<br/>  "staging": "arn:aws:kms:us-west-2:111122223333:key/HASH_KEY_NUMBER"<br/>}</pre> | no |
| <a name="input_policy_dci_administrator"></a> [policy\_dci\_administrator](#input\_policy\_dci\_administrator) | Administrator Policy Name | `string` | `"dci-administrator-policy"` | no |
| <a name="input_policy_dci_developer"></a> [policy\_dci\_developer](#input\_policy\_dci\_developer) | Developer Policy Name | `string` | `"dci-developer-policy"` | no |
| <a name="input_tf_user_executor"></a> [tf\_user\_executor](#input\_tf\_user\_executor) | TF User Executor | `string` | `"TF-User-Executor-111122223333"` | no |
| <a name="input_workspace_env"></a> [workspace\_env](#input\_workspace\_env) | Workspace Environment Selection | `map(string)` | <pre>{<br/>  "default": "default",<br/>  "lab": "rnd",<br/>  "prod": "prod",<br/>  "staging": "staging"<br/>}</pre> | no |
| <a name="input_workspace_name"></a> [workspace\_name](#input\_workspace\_name) | Workspace Environment Name | `string` | `"default"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_admin_group_arn"></a> [admin\_group\_arn](#output\_admin\_group\_arn) | Administrator Group Name |
| <a name="output_admin_group_name"></a> [admin\_group\_name](#output\_admin\_group\_name) | Administrator Group Name |
| <a name="output_dci_developer_policy"></a> [dci\_developer\_policy](#output\_dci\_developer\_policy) | DCI Developer Policy Name |
| <a name="output_dci_developer_policy_arn"></a> [dci\_developer\_policy\_arn](#output\_dci\_developer\_policy\_arn) | DCI Developer Policy ARN |
| <a name="output_developer_group_arn"></a> [developer\_group\_arn](#output\_developer\_group\_arn) | Developer Group Name |
| <a name="output_developer_group_name"></a> [developer\_group\_name](#output\_developer\_group\_name) | Developer Group Name |
| <a name="output_list_csiro_administrator"></a> [list\_csiro\_administrator](#output\_list\_csiro\_administrator) | CSIRO Administrator Account |
| <a name="output_list_csiro_developer"></a> [list\_csiro\_developer](#output\_list\_csiro\_developer) | CSIRO Developer Account |
| <a name="output_list_dci_administrator"></a> [list\_dci\_administrator](#output\_list\_dci\_administrator) | DCI Administrator Account |
| <a name="output_list_dci_developer"></a> [list\_dci\_developer](#output\_list\_dci\_developer) | DCI Developer Account |
| <a name="output_summary"></a> [summary](#output\_summary) | Summary IAM User Configuration |
<!-- END_TF_DOCS -->