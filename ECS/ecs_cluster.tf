resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.cluster_name
}

module "api" {
  source = "./api"

  project_name = var.project_name
  ecs_cluster = aws_ecs_cluster.ecs_cluster.arn
  public_subnet = var.public_subnet
  task_execution_role = var.task_execution_role
  http_security_group = var.http_security_group

  api_repository_name = var.api_repository_name
  api_service_name = var.api_service_name
  api_task_name = var.api_task_name
}