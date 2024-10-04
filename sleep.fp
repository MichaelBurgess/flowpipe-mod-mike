pipeline "long_sleep" {
  title       = "Long Sleep"
  description = "Sleep for a long time."

  step "sleep" "sleep_10_minutes" {
    duration   = "600s"
  }
}