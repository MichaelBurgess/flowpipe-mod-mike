trigger "schedule" "my_hourly_trigger" {
  title       = "Scheduled Input"
  description = "This trigger runs the input pipeline on a schedule."
  schedule    = "daily"
  pipeline    = pipeline.input_pipeline
}