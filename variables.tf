variable "secure" {
    type = bool
    description = "Whether this template is secure or not"
    default = false
}

variable "ics-test-bucket" {
  type = string
  description = "The name of our test bucket"
  default = "ics-demo-test-bucket"
}

