resource "aws_apprunner_service" "this" {
  service_name = var.app_name

  source_configuration {
    auto_deployments_enabled = true

    image_repository {
      image_identifier      = "${var.ecr_repository_url}:latest"
      image_repository_type = "ECR"

      image_configuration {
        port = var.container_port
        runtime_environment_variables = {
          DATABASE_URL = "postgres://${var.db_username}:${var.db_password}@${var.db_endpoint}/${var.db_name}"
        }
      }
    }
  }
}