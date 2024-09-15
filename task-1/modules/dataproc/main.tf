resource "google_dataproc_cluster" "default" {
  name   = var.cluster_name
  region = var.region

  cluster_config {
    master_config {
      num_instances = 1
      machine_type  = "n1-standard-4"
    }
    worker_config {
      num_instances = 2
      machine_type  = "n1-standard-4"
    }
  }

  project = var.project_id
}

output "cluster_id" {
  description = "Dataproc cluster ID"
  value       = google_dataproc_cluster.default.id
}
