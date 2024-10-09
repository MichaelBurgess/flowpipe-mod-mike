pipeline "message_pipeline" {
  title = "Message Pipeline"
  description = "Simple pipeline with message step"

  param "name" {
    type = string
    default = var.name
  }

  step "message" "say_hello" {
    notifier = var.default_notifier
    text     = "Hello, ${param.name}"
  }
}