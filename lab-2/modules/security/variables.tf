variable "vpc_id" {
  description = "The VPC ID from network module"
  type        = string
}
variable "subnet_ids" {
  description = "Map of subnet IDs to associate with the NACL"
  type        = map(string)
}
