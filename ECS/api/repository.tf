resource "aws_ecr_repository" "ecr_repo" {
  name = var.api_repository_name
}
