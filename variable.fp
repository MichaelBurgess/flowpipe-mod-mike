variable "default_notifier" {
  type        = string
  title       = "Default Notifier"
  description = "The name of the default notifier."
  default     = "default"
}

variable "default_pipes_connection" {
  type        = string
  title       = "Default Pipes connection."
  description = "The name of the default Pipes connection to resolve credentials for."
  default     = "default"
  tags = {
    folder = "Pipes Setup"
  }
}

variable "pipes_api_base_url" {
  type        = string
  title       = "Turbot Pipes API base URL"
  description = "The Turbot Pipes base URL to use."
  default     = "https://pipes.turbot.com"
  tags = {
    folder = "Pipes Setup"
  }
}

variable "database" {
  type    = connection.steampipe_pg
  default = connection.steampipe_pg.default
}

variable "name" {
  type        = string
  title       = "Name"
  description = "The name of the person."
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