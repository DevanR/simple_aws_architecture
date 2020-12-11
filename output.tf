output "ecr_repository_worker_endpoint" {
  value = aws_ecr_repository.ecr_repo.repository_url
}
