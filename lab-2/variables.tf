variable "root_vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "root_subnets" {
  default = {
    "public-1"  = { newbits = 8, netnum = 1, is_public = true }
    "private-1" = { newbits = 8, netnum = 2, is_public = false }
  }
}

variable "env" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
  default     = "dev"
}

variable "azs" {
  description = "Availability Zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}