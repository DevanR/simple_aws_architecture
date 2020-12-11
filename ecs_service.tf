resource "aws_ecs_service" "ecs_service" {
  name = "${var.APP_PREFIX}-ecs-service"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.task_definition.arn
  desired_count   = 1
  scheduling_strategy = "REPLICA"
}
