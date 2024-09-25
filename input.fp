pipeline "input_pipeline" {
  title = "Input Pipeline"
  description = "Simple pipeline with input step"

  step "input" "confirmation" {
    notifier = notifier[var.default_notifier]
    type     = "button"
    prompt   = "Do you want to approve?"

    option "Approve" {}
    option "Deny" {}
  }
}