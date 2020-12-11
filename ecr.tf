resource "aws_ecr_repository" "ecr_repo" {
  name = "${var.APP_PREFIX}-ecr-repo"
}
