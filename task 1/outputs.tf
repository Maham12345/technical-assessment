output "pubsub_topic" {
  description = "Pub/Sub topic created"
  value       = module.pubsub.topic
}

output "dataflow_job" {
  description = "Dataflow job created"
  value       = module.dataflow.job
}

output "dataproc_cluster" {
  description = "Dataproc cluster created"
  value       = module.dataproc.cluster_id
}

output "bigquery_dataset" {
  description = "BigQuery dataset created"
  value       = module.bigquery.dataset_id
}

output "composer_environment" {
  description = "Cloud Composer environment created"
  value       = module.composer.environment_name
}
