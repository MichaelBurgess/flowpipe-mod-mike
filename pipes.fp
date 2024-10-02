pipeline "list_pipes_orgs" {
  title       = "List Pipes Orgs"
  description = "List all Pipes orgs that the connection has access to."

  param "api_base_url" {
    type        = string
    description = "The Turbot Pipes base URL."
    default     = var.pipes_api_base_url
  }

  param "pipes_connection" {
    type        = string
    description = "The Turbot Pipes connection to use."
    default     = var.default_pipes_connection
  }

  step "http" "list_pipes_actor_orgs" {
    url      = "${param.api_base_url}/api/v0/actor/org?limit=100"
    method   = "get"
    insecure = param.api_base_url == "https://pipes.turbot-local.com:8443"
    request_headers = {
      Authorization : "Bearer ${connection.pipes[param.pipes_connection].token}"
      Content-Type : "application/json"
    }
  }

  output "output_orgs" {
    value = step.http.list_pipes_actor_orgs.response_body.items[*].org.handle
  }
}