variable "public" {
    type = bool
    description = "Whether the bucket is public or not"
    default = true
}

variable "ics-test-bucket" {
  type = string
  description = "The name of our test bucket"
  default = "ics-demo-test-bucket"
}

