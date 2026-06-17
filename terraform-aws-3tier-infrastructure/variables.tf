variable "region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"
}

variable "db_username" {
  description = "Database Username"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Database Password"
  type        = string
  sensitive   = true
}
