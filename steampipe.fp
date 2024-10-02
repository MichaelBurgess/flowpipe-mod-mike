pipeline "list_s3_buckets" {
  title       = "List S3 Buckets"
  description = "List all S3 buckets in the default Steampipe connection."

  param "database" {
    type    = connection.steampipe
    description = "The Steampipe database connection to use."
    # default     = var.database
    default = connection.steampipe.default
  }

  step "query" "list" {
    database = param.database
    sql      = "select name, _ctx ->> 'connection_name' as cred from aws_s3_bucket"
  }

  output "output_buckets" {
    value = step.query.list.rows[*]
  }
}