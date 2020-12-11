resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.APP_PREFIX}-ecr-cluster"
}
