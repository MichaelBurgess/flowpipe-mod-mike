pipeline "do_stuff" {
  step "input" "confirmation" {
    notifier = notifier["default"]
    type     = "button"
    prompt   = "Do you want to approve?"

    option "Approve" {}
    option "Deny" {}
  }
}