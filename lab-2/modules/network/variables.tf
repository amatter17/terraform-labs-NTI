variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnets" {
  description = "Map of subnets to create"
  type = map(object({
    newbits   = number
    netnum    = number
    is_public = bool
  }))
}

variable "env" {
  description = "Environment name"
  type        = string
}

variable "azs" {
  description = "Availability Zones"
  type        = list(string)
}