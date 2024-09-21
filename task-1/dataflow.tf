# Create a Dataflow job to process Pub/Sub data and store in BigQuery
resource "google_dataflow_job" "pubsub_to_bigquery" {
  name              = "pubsub-to-bigquery-job"
  template_gcs_path = "gs://dataflow-templates/latest/PubSub_to_BigQuery"
  temp_gcs_location = "gs://ecommerce-data-bucket/tmp/" # Ensure this bucket exists

  parameters = {
    inputTopic  = google_pubsub_topic.ecommerce_data_topic.id
    outputTableSpec = "metal-music-435521-a6:ecommerce_data_warehouse.ecommerce_data"
  }
}
