# Terraform Module EKS

## How-to-Use

- Create `provider.tf`, add this line:

  ```
  terraform {
    required_version = ">= 1.8.4"

    required_providers {
      aws = {
        source  = "hashicorp/aws"
        version = ">= 5.72"
      }
      tls = {
        source  = "hashicorp/tls"
        version = ">= 3.0"
      }
      kubernetes = {
        source  = "hashicorp/kubernetes"
        version = ">= 2.10"
      }

      random = ">= 2.0"
    }
  }
  ```

- Setup AWS Credentials & Config

  ```
  $HOME/.aws/credentials
  ---
  [DevOpsCorner-TF-User]
  aws_access_key_id =
  aws_secret_access_key =

  $HOME/.aws/config
  ---
  [profile DevOpsCorner-TF-User]
  role_arn = arn:aws:iam::111122223333:role/TF-Central-Role_111122223333
  source_profile = DevOpsCorner-TF-User
  region = us-west-2
  output = json
  ```

- Change AWS Profile and Region

  ```
  unset AWS_SESSION_TOKEN AWS_SECRET_ACCESS_KEY AWS_ACCESS_KEY_ID

  export AWS_PROFILE=DevOpsCorner-TF-User
  export AWS_DEFAULT_REGION=us-west-2

  aws sts get-caller-identity --profile $AWS_PROFILE
  ```

- Run `terraform init`


## How-to-Deploy

- Terraform Initialize

  ```
  tofu init
  ```

- List Existing Workspace

  ```
  tofu workspace list
  ```

- Create Workspace

  ```
  tofu workspace new [environment]
  ---
  eg:
  tofu workspace new lab
  tofu workspace new staging
  tofu workspace new prod
  ```

- Use Workspace

  ```
  tofu workspace select [environment]
  ---
  eg:
  tofu workspace select lab
  tofu workspace select staging
  tofu workspace select prod
  ```

- Terraform Planning

  ```
  tofu plan
  ```

- Terraform Provisioning

  ```
  tofu apply
  ```

## Migrate State

- Rename Backend

  ```
  mv backend.tf.example backend.tf
  ```

- Initiate Migrate

  ```
  tofu init --migrate-state
  ```

## Cleanup Environment

```
tofu destroy
```

## Copyright

- Author: **Dwi Fahni Denni (@zeroc0d3)**
- Vendor: **DevOps Corner Indonesia (dci.id)**
- License: **Apache v2**
