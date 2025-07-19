output "app_url" {
  value = module.app_runner.service_url
}

output "database_endpoint" {
  value = module.database.endpoint
}