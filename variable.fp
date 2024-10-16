variable "default_notifier" {
  title       = "Default Notifier"
  description = "The name of the default notifier."
  type        = notifier
  default     = notifier.default
}

variable "default_notifiers" {
  title       = "Default Notifiers"
  description = "The names of the default notifiers."
  type        = list(notifier)
  default     = [notifier.default]
}

variable "default_pipes_connection" {
  title       = "Default Pipes connection"
  description = "The name of the default Pipes connection to resolve credentials for."
  type        = connection.pipes
  default     = connection.pipes.default
  tags = {
    folder = "Pipes Setup"
  }
}

variable "pipes_api_base_url" {
  title       = "Turbot Pipes API base URL"
  description = "The Turbot Pipes base URL to use."
  type        = string
  default     = "https://pipes.turbot-stg.com"
  tags = {
    folder = "Pipes Setup"
  }
}

variable "steampipe_database" {
  title       = "Steampipe Database"
  description = "The Steampipe database connection."
  type        = connection.steampipe
  default     = connection.steampipe.default
}

variable "name" {
  title       = "Name"
  description = "The name of the person."
  type        = string
  default     = "Mike"
  tags = {
    folder = "User Profile"
  }
}

variable "age" {
  type        = number
  title       = "Age"
  description = "The age of the person."
  default     = 21
  tags = {
    folder = "User Profile"
  }
}

variable "favourite_colours" {
  type = list(string)
  title       = "Favourite Colour"
  description = "The favourite colour of the person."
  default = ["Green"]
  enum = ["Red", "Green", "Blue"]
  tags = {
    folder = "User Profile"
  }
}