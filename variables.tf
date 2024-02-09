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

variable "address" {
  sensitive = true
  type      = string
}

variable "phone_number" {
  sensitive = true
  type      = string

  validation {
    condition     = can(regex("^[0-9]{3}-[0-9]{3}-[0-9]{4}$", var.phone_number))
    error_message = "Phone number must be in the format xxx-xxx-xxxx ."
  }
}

variable "email_address" {
  type = string
  validation {
    # This regex is _extremely_ forgiving.
    condition     = can(regex("^.+@.+[.].+$", var.email_address))
    error_message = "Email address must be in the format x@y.z ."
  }
}

variable "tagline" {
  type = string
}

variable "work_history" {
  sensitive = true
  type = list(object({
    job_type   = string
    company    = string
    start_year = string
    end_year   = string
    positions = list(object({
      title = string
      tasks = list(string)
      responsibilities = optional(list(object({
        top_level = string
        sub_level = optional(list(string))
      })))
    }))
  }))
}

variable "github_page" {
  type = string

  validation {
    condition     = can(regex("^https://github.com/.+/.+$", var.github_page))
    error_message = "github_page must be a valid GitHub repo page of the form https://github.com/<organization>/<project>"
  }
}
