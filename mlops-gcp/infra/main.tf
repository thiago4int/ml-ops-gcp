provider "google" {
  project = var.project_id
  region  = var.region
}

module "storage" {
  source      = "./modules/storage"
  bucket_name = var.bucket_name
  region      = var.region
}

module "composer" {
  source           = "./modules/composer"
  composer_env_name = var.composer_env_name
  region           = var.region
}

module "vertex_ai" {
  source              = "./modules/vertex_ai"
  model_display_name  = var.model_display_name
  region              = var.region
}