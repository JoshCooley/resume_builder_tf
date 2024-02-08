variable "first_name" {
  type = string
}

variable "middle_initial" {
  type = string

  validation {
    condition     = can(regex("[A-Z]", var.middle_initial))
    error_message = "Middle initial must be one uppercase letter."
  }
}

variable "last_name" {
  type = string
}
