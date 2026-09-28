locals {
  project_name = "lab"
  environment  = "dev"

  resource_prefix = "${local.project_name}-${local.environment}"

  common_tags = {
    Environment = local.environment
    Project     = local.project_name
    ManagedBy   = "Terraform"
  }
}