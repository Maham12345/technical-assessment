resource "google_dataflow_job" "default" {
  name        = var.job_name
  template_gcs_path = "gs://dataflow-templates/latest/Stream_BigQuery"
  temp_gcs_location = "gs://${var.project_id}-dataflow-temp"
  parameters = {
    inputTopic = module.pubsub.topic
    outputTableSpec = "${var.project_id}:${var.bigquery_dataset_name}.realtime_data"
  }
  project = var.project_id
  region  = var.region
}

output "job" {
  description = "Dataflow job created"
  value       = google_dataflow_job.default.id
}
