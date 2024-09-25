variable "name" {
  type        = string
  description = "The name of the person/thing."
  default     = "World"
}

pipeline "hello" {
  param "name" {
    type    = string
    default = var.name
  }

#   step "message" "notify_hello" {
#     notifier = notifier.default
#     text = "Hello, ${param.name}!"
#   }

  output "ouput_hello" {
    value = "Hello, ${param.name}!"
  }
}

pipeline "get_astronauts" {
  step "http" "whos_in_space" {
    url    = "http://api.open-notify.org/astros"
    method = "get"
  }

  output "people_in_space" {
    value = step.http.whos_in_space.response_body.people
  }
}

pipeline "output_astronauts" {
  step "pipeline" "get_astronauts" {
      pipeline = pipeline.get_astronauts
  }

  step "transform" "astronaut_names" {
    value = { for row in step.pipeline.get_astronauts.output.people_in_space : row.name => row }
  }

  output "people_by_name" {
    value = step.transform.astronaut_names.value
  }
}