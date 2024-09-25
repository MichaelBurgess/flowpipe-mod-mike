pipeline "do_stuff" {
  step "input" "confirmation" {
    notifier = notifier["workspace_owners"]
    type     = "button"
    prompt   = "Do you want to approve?"

    option "Approve" {}
    option "Deny" {}
  }
}