terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "network" {
  source   = "./modules/network"
  vpc_cidr = var.root_vpc_cidr
  subnets  = var.root_subnets
  env      = var.env
  azs      = var.azs
}

module "security" {
  source = "./modules/security"
  vpc_id = module.network.vpc_id
  subnet_ids = module.network.subnet_ids
}

module "compute" {
  source     = "./modules/compute"
  subnet_ids = module.network.subnet_ids
  sg_id      = module.security.sg_id
  vpc_id     = module.network.vpc_id
}