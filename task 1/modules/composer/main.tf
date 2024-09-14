resource "google_composer_environment" "default" {
  name    = var.environment_name
  project = var.project_id
  region  = var.region

  config {
    node_count = 3
    software_config {
      image_version = "composer-1.17.0-airflow-1.10.15"
    }
  }
}

output "environment_name" {
  description = "Cloud Composer environment name"
  value       = google_composer_environment.default.name
}
