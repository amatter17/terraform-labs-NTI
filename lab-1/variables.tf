variable "instance_type" {
  description = "The type of EC2 instance"
  type        = string
  default     = "t3.micro"

  validation {
    condition     = contains(["t3.micro"], var.instance_type)
    error_message = "Instance type must t3.micro."
  }
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0c7217cdde317cfec"
}

variable "db_password" {
  description = "A dummy password to test sensitive attribute"
  type        = string
  sensitive   = true
  default     = "SecretPass123!"
}