# Create a Cloud Composer environment
resource "google_composer_environment" "composer_env" {
  name   = "ecommerce-analytics-workflow"
  region = "europe-west2"

  config {
    
    software_config {
      image_version = "composer-3-airflow-2.9.1"
    }
  }
}
