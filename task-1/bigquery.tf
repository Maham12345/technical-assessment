# Create a BigQuery dataset
resource "google_bigquery_dataset" "ecommerce_data_warehouse" {
  dataset_id = "ecommerce_data_warehouse"
  location   = "EU"
}