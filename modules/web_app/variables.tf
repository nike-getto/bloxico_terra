variable "profile" {
  description = "AWS profile"
  type        = string
}

variable "region" {
  description = "AWS region to deploy to"
  type        = string
}

variable "application_name" {
  description = "The name of the application"
  type        = string
}

variable "environment" {
  description = "Application environment"
  type        = string
}
