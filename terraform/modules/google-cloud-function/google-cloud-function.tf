# Local variables
locals {
  timestamp = formatdate("YYMMDDhhmmss", timestamp())
  root_dir = abspath("../")
}

# Archive of the source code compressed as a .zip file (relative path from main.tf)
data "archive_file" "source" {
  type        = "zip"
  source_dir  = "./../src"
  output_path = "./tmp/function-${local.timestamp}.zip"
}

# Bucket to store function code
resource "google_storage_bucket" "bucket-dev-002" {
  name     = "bucket-dev-002"
  location = "${var.region}"
  force_destroy = true
  uniform_bucket_level_access = true
  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}

# Create zip object in bucket from archive
resource "google_storage_bucket_object" "archive" {
  name   = "src-${data.archive_file.source.output_md5}.zip"
  content_type = "application/zip"
  
  bucket = google_storage_bucket.bucket-dev-002.name
  source = data.archive_file.source.output_path
}

# Google function
resource "google_cloudfunctions_function" "function-dev-001" {
	name        = "${var.project_id}-function-dev-001"
	description = "Google Cloud Function"
	runtime     = "nodejs16"

	available_memory_mb   = 128
	source_archive_bucket = google_storage_bucket.bucket-dev-002.name
	source_archive_object = google_storage_bucket_object.archive.name
	trigger_http          = true
	entry_point           = "main"
}

# Function invoker
resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.function-dev-001.project
  region         = google_cloudfunctions_function.function-dev-001.region
  cloud_function = google_cloudfunctions_function.function-dev-001.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}
