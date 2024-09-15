resource "google_pubsub_topic" "default" {
  name    = var.topic_name
  project = var.project_id
}

output "topic" {
  description = "Pub/Sub topic created"
  value       = google_pubsub_topic.default.name
}
