resource "google_bigquery_dataset" "default" {
  dataset_id = var.dataset_name
  project    = var.project_id
  location   = var.region
}

output "dataset_id" {
  description = "BigQuery dataset ID"
  value       = google_bigquery_dataset.default.dataset_id
}
