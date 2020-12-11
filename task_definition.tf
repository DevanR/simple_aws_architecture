resource "aws_ecs_task_definition" "task_definition" {
  family = "${var.APP_PREFIX}-docker-django"

  container_definitions = templatefile("task_definitions/docker_django.json", {
    image =  "${aws_ecr_repository.ecr_repo.repository_url}:latest"
  })
}
