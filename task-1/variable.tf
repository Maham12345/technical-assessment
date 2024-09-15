variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "pubsub_topic_name" {
  description = "Pub/Sub topic name"
  type        = string
  default     = "ecommerce-data-topic"
}

variable "dataflow_job_name" {
  description = "Dataflow job name"
  type        = string
  default     = "dataflow-realtime-job"
}

variable "dataproc_cluster_name" {
  description = "Dataproc cluster name"
  type        = string
  default     = "dataproc-batch-cluster"
}

variable "bigquery_dataset_name" {
  description = "BigQuery dataset name"
  type        = string
  default     = "ecommerce_analytics"
}

variable "composer_env_name" {
  description = "Cloud Composer environment name"
  type        = string
  default     = "composer-workflow"
}
