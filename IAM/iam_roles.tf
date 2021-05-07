resource "aws_iam_role" "ECS_task_definition_role" {
  name = "ECS_task_execution_role"
  assume_role_policy = file("IAM/ecs_assume_role_policy.json")
  tags = {

  }
}

resource "aws_iam_policy" "ECS_task_execution_policy" {
  name = "ECS_task_execution_policy"
  description = "terraform generated ECS task execution policy"

  policy = file("IAM/ECS_task_execution_role.json")
}

resource "aws_iam_role_policy_attachment" "ECS_task_definition_attachment" {
  role = aws_iam_role.ECS_task_definition_role.name
  policy_arn = aws_iam_policy.ECS_task_execution_policy.arn
}


output "ECS_task_execution_role" {
  value = aws_iam_role.ECS_task_definition_role
}