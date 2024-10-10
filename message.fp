pipeline "message_pipeline" {
  title = "Message Pipeline"
  description = "Simple pipeline with message step"

  param "name" {
    type = string
    default = var.name
  }

  param "notifiers" {
    type = list(notifier)
    default = var.default_notifiers
  }

  step "message" "say_hello" {
    for_each = param.notifiers
    notifier = notifier[each.value.name]
    text     = "Hello, ${param.name}"
  }
}