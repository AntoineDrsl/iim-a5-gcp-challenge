# Create dataset
resource "google_bigquery_dataset" "iim_dataset_dev_001" {
  dataset_id                  = "iim_dataset_dev_001"
  friendly_name               = "iim_dataset_dev_001"
  description                 = "IIM dataset"
  location                    = "${var.region}"
}

# Create table
resource "google_bigquery_table" "iim-table-dev-001" {
  dataset_id = google_bigquery_dataset.iim_dataset_dev_001.dataset_id
  table_id   = "iim-table-dev-001"
  deletion_protection = false

  time_partitioning {
    type = "DAY"
  }

  schema = <<EOF
[
  {
    "name": "id",
    "type": "STRING",
    "mode": "REQUIRED",
    "description": "Unique id"
  }
]
EOF

}
