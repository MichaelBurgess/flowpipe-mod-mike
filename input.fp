pipeline "do_stuff" {
  step "input" "confirmation" {
    notifier = notifier[var.default_notifier]
    type     = "button"
    prompt   = "Do you want to approve?"

    option "Approve" {}
    option "Deny" {}
  }
}