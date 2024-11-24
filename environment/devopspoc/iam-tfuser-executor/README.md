# Terraform IAM TF-Executor-User for 111122223333

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
| <a name="module_iam-tfuser"></a> [iam-tfuser](#module\_iam-tfuser) | ../../../modules//iam-tfuser-executor | n/a |

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
| <a name="input_department"></a> [department](#input\_department) | Department Owner | `string` | `"DEVOPS"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Target Environment (tags) | `map(string)` | <pre>{<br/>  "default": "DEF",<br/>  "lab": "RND",<br/>  "nonprod": "NONPROD",<br/>  "prod": "PROD",<br/>  "staging": "STG"<br/>}</pre> | no |
| <a name="input_group_tf_administrator"></a> [group\_tf\_administrator](#input\_group\_tf\_administrator) | Administrator Group Name | `string` | `"tf-administrator"` | no |
| <a name="input_kms_env"></a> [kms\_env](#input\_kms\_env) | KMS Key Environment | `map(string)` | <pre>{<br/>  "lab": "RnD",<br/>  "nonprod": "NonProduction",<br/>  "prod": "Production",<br/>  "staging": "Staging"<br/>}</pre> | no |
| <a name="input_kms_key"></a> [kms\_key](#input\_kms\_key) | KMS Key References | `map(string)` | <pre>{<br/>  "default": "arn:aws:kms:us-west-2:111122223333:key/HASH_KEY_NUMBER",<br/>  "lab": "arn:aws:kms:us-west-2:111122223333:key/HASH_KEY_NUMBER",<br/>  "prod": "arn:aws:kms:us-west-2:111122223333:key/HASH_KEY_NUMBER",<br/>  "staging": "arn:aws:kms:us-west-2:111122223333:key/HASH_KEY_NUMBER"<br/>}</pre> | no |
| <a name="input_policy_tf_administrator"></a> [policy\_tf\_administrator](#input\_policy\_tf\_administrator) | Administrator Policy Name | `string` | `"tf-administrator-policy"` | no |
| <a name="input_tf_user_executor"></a> [tf\_user\_executor](#input\_tf\_user\_executor) | TF User Executor | `string` | `"TF-User-Executor-111122223333"` | no |
| <a name="input_workspace_env"></a> [workspace\_env](#input\_workspace\_env) | Workspace Environment Selection | `map(string)` | <pre>{<br/>  "default": "default",<br/>  "lab": "rnd",<br/>  "nonprod": "nonprod",<br/>  "prod": "prod",<br/>  "staging": "staging"<br/>}</pre> | no |
| <a name="input_workspace_name"></a> [workspace\_name](#input\_workspace\_name) | Workspace Environment Name | `string` | `"default"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_admin_group_arn"></a> [admin\_group\_arn](#output\_admin\_group\_arn) | Administrator Group Name |
| <a name="output_admin_group_name"></a> [admin\_group\_name](#output\_admin\_group\_name) | Administrator Group Name |
| <a name="output_summary"></a> [summary](#output\_summary) | Summary IAM TF-User Configuration |
| <a name="output_tf_user_executor_account"></a> [tf\_user\_executor\_account](#output\_tf\_user\_executor\_account) | TF-User-Executor Account Name |
| <a name="output_tf_user_executor_arn"></a> [tf\_user\_executor\_arn](#output\_tf\_user\_executor\_arn) | TF-User-Executor ARN |
| <a name="output_tfrole_central"></a> [tfrole\_central](#output\_tfrole\_central) | Terraform Central Role |
| <a name="output_tfrole_central_arn"></a> [tfrole\_central\_arn](#output\_tfrole\_central\_arn) | Terraform Central Role |
<!-- END_TF_DOCS -->