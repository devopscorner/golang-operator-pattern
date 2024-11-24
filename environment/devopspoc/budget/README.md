# Terraform Budget for 111122223333

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
| <a name="module_budget"></a> [budget](#module\_budget) | ../../../modules//budget | n/a |

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
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region to deploy the Budget in | `string` | `"us-west-2"` | no |
| <a name="input_aws_secret_key"></a> [aws\_secret\_key](#input\_aws\_secret\_key) | The AWS Secret Key | `string` | `""` | no |
| <a name="input_department"></a> [department](#input\_department) | Department Owner | `string` | `"DEVOPS"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Target Environment (tags) | `map(string)` | <pre>{<br/>  "default": "DEF",<br/>  "lab": "RND",<br/>  "nonprod": "NONPROD",<br/>  "prod": "PROD",<br/>  "staging": "STG"<br/>}</pre> | no |
| <a name="input_monthly_budget_limit_amount"></a> [monthly\_budget\_limit\_amount](#input\_monthly\_budget\_limit\_amount) | Monthly Budget Limit Amount | `string` | `"150"` | no |
| <a name="input_monthly_budget_limit_unit"></a> [monthly\_budget\_limit\_unit](#input\_monthly\_budget\_limit\_unit) | Monthly Budget Limit Unit | `string` | `"USD"` | no |
| <a name="input_monthly_budget_name"></a> [monthly\_budget\_name](#input\_monthly\_budget\_name) | Monthly Budget Name | `string` | `"monthly_budget_150"` | no |
| <a name="input_monthly_budget_notification_subscriber"></a> [monthly\_budget\_notification\_subscriber](#input\_monthly\_budget\_notification\_subscriber) | Monthly Budget Notification Subscriber Email Address | `string` | `"support@devopscorner.id"` | no |
| <a name="input_monthly_forcasted_limit_amount"></a> [monthly\_forcasted\_limit\_amount](#input\_monthly\_forcasted\_limit\_amount) | Monthly Forcasted Limit Amount | `string` | `"100"` | no |
| <a name="input_monthly_forcasted_limit_unit"></a> [monthly\_forcasted\_limit\_unit](#input\_monthly\_forcasted\_limit\_unit) | Monthly Forcasted Limit Unit | `string` | `"USD"` | no |
| <a name="input_monthly_forcasted_name"></a> [monthly\_forcasted\_name](#input\_monthly\_forcasted\_name) | Monthly Forcasted Name | `string` | `"monthly_forcasted_100"` | no |
| <a name="input_monthly_forcasted_notification_subscriber"></a> [monthly\_forcasted\_notification\_subscriber](#input\_monthly\_forcasted\_notification\_subscriber) | Monthly Forcasted Notification Subscriber Email Address | `string` | `"support@devopscorner.id"` | no |
| <a name="input_workspace_env"></a> [workspace\_env](#input\_workspace\_env) | Workspace Environment Selection | `map(string)` | <pre>{<br/>  "default": "default",<br/>  "lab": "rnd",<br/>  "nonprod": "nonprod",<br/>  "prod": "prod",<br/>  "staging": "staging"<br/>}</pre> | no |
| <a name="input_workspace_name"></a> [workspace\_name](#input\_workspace\_name) | Workspace Environment Name | `string` | `"default"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_billing_monthly_billing_info"></a> [billing\_monthly\_billing\_info](#output\_billing\_monthly\_billing\_info) | Monthly budget billing info |
| <a name="output_billing_monthly_billing_notif"></a> [billing\_monthly\_billing\_notif](#output\_billing\_monthly\_billing\_notif) | Monthly budget billing notification email |
| <a name="output_billing_monthly_forcasted_info"></a> [billing\_monthly\_forcasted\_info](#output\_billing\_monthly\_forcasted\_info) | Monthly forcasted billing info |
| <a name="output_billing_monthly_forcasted_notif"></a> [billing\_monthly\_forcasted\_notif](#output\_billing\_monthly\_forcasted\_notif) | Monthly forcasted billing notification email |
<!-- END_TF_DOCS -->