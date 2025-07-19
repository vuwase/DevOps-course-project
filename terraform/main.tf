provider "aws" {
  region = "us-east-1"
}

module "ecr" {
  source    = "./modules/ecr"
}

module "database" {
  source     = "./modules/rds"
  app_name   = "my-app"
  db_name    = "mydb"
  db_username = "admin"
  db_password = var.db_password
}

module "app_runner" {
  source              = "./modules/app_runner"
  app_name           = "my-app"
  ecr_repository_url = module.ecr.repository_url
  db_endpoint        = module.database.endpoint
  db_username        = "admin"
  db_password        = var.db_password
  db_name            = "mydb"
}