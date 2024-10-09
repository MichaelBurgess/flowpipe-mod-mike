pipeline "message_pipeline" {
  title = "Input Pipeline"
  description = "Simple pipeline with input step"

  param "name" {
    type = string
    default = var.name
  }

  step "message" "say_hello" {
    notifier = var.default_notifier
    text     = "Hello, ${param.name}"
  }
}