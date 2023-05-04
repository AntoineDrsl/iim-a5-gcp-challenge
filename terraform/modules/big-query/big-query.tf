# Create dataset
resource "google_bigquery_dataset" "dataset_dev_001" {
  dataset_id                  = "dataset_dev_001"
  friendly_name               = "dataset_dev_001"
  description                 = "Dev dataset"
  location                    = "${var.region}"
}

# Create table
resource "google_bigquery_table" "table-dev-001" {
  dataset_id = google_bigquery_dataset.dataset_dev_001.dataset_id
  table_id   = "table-dev-001"

  time_partitioning {
    type = "DAY"
  }
}
