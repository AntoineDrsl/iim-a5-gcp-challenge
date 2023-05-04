# Storage bucket for backend
resource "google_storage_bucket" "iim-bucket-dev-001" {
  name     = "iim-bucket-dev-001"
  location = "${var.region}"
  force_destroy = true
  uniform_bucket_level_access = true
  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}