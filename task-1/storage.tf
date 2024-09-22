# Create a Cloud Storage bucket
resource "google_storage_bucket" "ecommerce_data_bucket" {
  name     = "ecommerce-data-bucket-metal-music-435521-a6"
  location = "EU"

  versioning {
    enabled = true
  }
}


# Create a Cloud Storage bucket for batch data
resource "google_storage_bucket" "input_data_bucket" {
  name     = "input-data-bucket-metal-music-435521-a6"  
  location = "EU"                        
}