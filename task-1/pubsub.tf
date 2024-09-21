# Create a Pub/Sub topic
resource "google_pubsub_topic" "ecommerce_data_topic" {
  name = "ecommerce-data-topic"
}

# Create a Pub/Sub subscription
resource "google_pubsub_subscription" "ecommerce_data_subscription" {
  name  = "ecommerce-data-subscription"
  topic = google_pubsub_topic.ecommerce_data_topic.name
}
