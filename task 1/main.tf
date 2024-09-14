module "pubsub" {
  source         = "./modules/pubsub"
  topic_name     = var.pubsub_topic_name
  project_id     = var.project_id
}

module "dataflow" {
  source         = "./modules/dataflow"
  job_name       = var.dataflow_job_name
  project_id     = var.project_id
  region         = var.region
  pubsub_topic   = module.pubsub.topic
}

module "dataproc" {
  source             = "./modules/dataproc"
  cluster_name       = var.dataproc_cluster_name
  project_id         = var.project_id
  region             = var.region
}

module "bigquery" {
  source             = "./modules/bigquery"
  dataset_name       = var.bigquery_dataset_name
  project_id         = var.project_id
}

module "composer" {
  source             = "./modules/composer"
  environment_name   = var.composer_env_name
  project_id         = var.project_id
  region             = var.region
}
