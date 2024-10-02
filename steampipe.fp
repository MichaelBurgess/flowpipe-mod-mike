pipeline "list_s3_buckets" {
  title       = "List S3 Buckets"
  description = "List all S3 buckets in the default Steampipe connection."

  param "steampipe_database" {
    type    = connection.steampipe
    description = "The Steampipe database connection to use."
    default     = var.steampipe_database
  }

  step "query" "list" {
    database = param.steampipe_database
    sql      = "select name, _ctx ->> 'connection_name' as cred from aws_s3_bucket"
  }

  step "message" "output_buckets" {
    for_each = step.query.list.rows
    notifier = notifier[var.default_notifier]
    text = "Found bucket: ${each.value.name} in connection: ${each.value.cred}"
  }

  output "output_buckets" {
    value = step.query.list.rows[*]
  }
}