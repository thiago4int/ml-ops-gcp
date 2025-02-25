output "bucket_name" {
  description = "Nome do bucket de Cloud Storage"
  value       = google_storage_bucket.mlops_bucket.name
}

output "composer_environment" {
  description = "Nome do ambiente Cloud Composer"
  value       = google_composer_environment.mlops_composer.name
}

output "vertex_ai_training_job" {
  description = "Nome do Job de Treinamento no Vertex AI"
  value       = google_ai_platform_training_job.training_job.name
}

output "mlops_pipeline_logs" {
  description = "URL do Cloud Logging para o pipeline"
  value       = "https://console.cloud.google.com/logs/query;query=resource.labels.project_id%3D%22${var.project_id}%22"
}