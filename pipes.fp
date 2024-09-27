pipeline "list_turbot_pipes_orgs" {
  param "api_base_url" {
    type = string
    description = "The Turbot Pipes base URL."
    default = var.turbot_pipes_api_base_url
  }

  param "turbot_pipes_connection" {
    type = string
    description = "The Turbot Pipes connection to use."
    default = var.default_turbot_pipes_connection
  }

  step "http" "list_turbot_pipes_actor_orgs" {
    url = "${param.api_base_url}/api/v0/actor/org?limit=100"
    method = "get"
    insecure = param.api_base_url == "https://pipes.turbot-local.com:8443"
    request_headers = {
      Authorization: "Bearer ${connection.turbot_pipes[param.turbot_pipes_connection].token}"
      Content-Type: "application/json"
    }
  }

  output "output_orgs" {
    value = step.http.list_turbot_pipes_actor_orgs.response_body.items[*].org.handle
  }
}