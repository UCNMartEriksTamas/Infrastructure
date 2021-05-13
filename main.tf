terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "miitfstatebucket"
    key = "ucn_project.tfstate"
    region = "eu-central-1"
  }
}

provider "aws" {
  region = var.region
}

module "network" {
  source = "./network"
  project_name = var.project_name
}

module "IAM" {
  source = "./IAM"
}

module "ecs" {
  source = "./ECS"
  cluster_name = var.cluster_name
  project_name = var.project_name

  api_repository_name = var.api_repository_name
  api_service_name = var.api_service_name
  api_task_name = var.api_task_name

  public_subnet = module.network.public_subnet
  http_security_group = module.network.http_security_group
  task_execution_role = module.IAM.ECS_task_execution_role
}

module "database" {
  source = "./database"
  mssql_username = var.mssql_username
  mssql_password = var.mssql_password
}
