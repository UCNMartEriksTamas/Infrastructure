resource "aws_ecs_service" client_service_name {
  name = var.api_service_name
  cluster = var.ecs_cluster
  task_definition = aws_ecs_task_definition.api_task.arn
  desired_count = 1
  launch_type = "FARGATE"

  network_configuration {
    subnets = [var.public_subnet.id]
    security_groups = [var.http_security_group.id]
    assign_public_ip = true
  }
}