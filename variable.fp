variable "default_notifier" {
  type        = string
  title = "Default Notifier"
  description = "The name of the default notifier."
  default     = "default"
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

variable "favourite_colour" {
  type        = string
  title       = "Favourite Colour"
  description = "The favourite colour of the person."
  default     = "Green"
  tags = {
    folder = "User Profile"
  }
}