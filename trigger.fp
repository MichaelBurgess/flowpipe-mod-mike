trigger "schedule" "my_hourly_trigger" {
  title       = "Scheduled Hello"
  description = "This trigger runs the hello pipeline on a schedule."

  schedule = "daily"

  pipeline = pipeline.hello

  param "name" {
    type    = string
    default = var.name
  }

  args = {
    name = "World"
  }

}