trigger "schedule" "my_hourly_trigger" {
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