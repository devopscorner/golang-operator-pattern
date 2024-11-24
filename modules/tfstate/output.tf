# ==========================================================================
#  Module TFState: output.tf
# --------------------------------------------------------------------------
#  Description
#    Output Terraform Value
# --------------------------------------------------------------------------
#    - DynamoDB ARN
#    - DynamoDB Table Id
#    - DynamoDB Table ARN
#    - DynamoDB Table Label
#    - S3 Bucket Name
#    - S3 Bucket ARN
#    - S3 Bucket Region
# ==========================================================================

# --------------------------------------------------------------------------
#  DynamoDB
# --------------------------------------------------------------------------
output "dynamodb_table_arn" {
  description = "ARN of the DynamoDB table"
  value       = module.dynamodb.dynamodb_table_arn
}

output "dynamodb_table_id" {
  description = "ID of the DynamoDB table"
  value       = module.dynamodb.dynamodb_table_id
}

output "dynamodb_table_stream_arn" {
  description = "The ARN of the Table Stream. Only available when var.stream_enabled is true"
  value       = module.dynamodb.dynamodb_table_stream_arn
}

output "dynamodb_table_stream_label" {
  description = "A timestamp, in ISO 8601 format of the Table Stream. Only available when var.stream_enabled is true"
  value       = module.dynamodb.dynamodb_table_stream_label
}

# --------------------------------------------------------------------------
#  S3 Bucket
# --------------------------------------------------------------------------
output "s3_bucket_id" {
  description = "The ID of the bucket."
  value       = module.s3_bucket.s3_bucket_id
}

output "s3_bucket_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = module.s3_bucket.s3_bucket_arn
}

output "s3_bucket_region" {
  description = "The AWS region this bucket resides in."
  value       = module.s3_bucket.s3_bucket_region
}

output "s3_bucket_policy" {
  description = "The AWS policy this bucket."
  value       = module.s3_bucket.s3_bucket_policy
}

output "s3_bucket_domain_name" {
  description = "The domain name this bucket."
  value       = module.s3_bucket.s3_bucket_bucket_domain_name
}

output "s3_bucket_regional_domain_name" {
  description = "The regional domain name this bucket."
  value       = module.s3_bucket.s3_bucket_bucket_regional_domain_name
}

output "s3_bucket_hosted_zone_id" {
  description = "The host zone id this bucket."
  value       = module.s3_bucket.s3_bucket_hosted_zone_id
}

output "s3_bucket_lifecycle_configuration_rules" {
  description = "The lifecycle configuration rules this bucket."
  value       = module.s3_bucket.s3_bucket_lifecycle_configuration_rules
}

output "s3_bucket_website_domain" {
  description = "The website domain this bucket."
  value       = module.s3_bucket.s3_bucket_website_domain
}

output "s3_bucket_website_endpoint" {
  description = "The website endpoint this bucket."
  value       = module.s3_bucket.s3_bucket_website_endpoint
}