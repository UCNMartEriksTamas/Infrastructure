data "template_file" "container_definitions" {
  template = file("ECS/task_definition_template.json")
  vars = {
    name = var.api_repository_name
    repository_url = aws_ecr_repository.ecr_repo.repository_url
  }
}

resource "aws_ecs_task_definition" "api_task" {
  family = var.api_task_name
  container_definitions = data.template_file.container_definitions.rendered

  requires_compatibilities = ["FARGATE"]
  execution_role_arn = var.task_execution_role.arn

  network_mode = "awsvpc"
  cpu = 256
  memory = 512
}