terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }

  # backend "gcs" {
  #     bucket  = "iim-bucket-dev-001"
  #     prefix  = "terraform/state"
  # }
}
provider "google" {
  version = "4.63.1"
  project = "${var.project_id}"
  region  = "${var.region}"
  zone    = "${var.zone}"
}

module "storage" {
  source = "./modules/storage"

  project_id="${var.project_id}"
  region="${var.region}"
  zone="${var.zone}"
}
module "google-cloud-function" {
  source = "./modules/google-cloud-function"

  project_id="${var.project_id}"
  region="${var.region}"
  zone="${var.zone}"
}
module "big-query" {
  source = "./modules/big-query"

  project_id="${var.project_id}"
  region="${var.region}"
  zone="${var.zone}"
}
module "monitoring-dashboard" {
  source = "./modules/monitoring-dashboard"

  project_id="${var.project_id}"
  region="${var.region}"
  zone="${var.zone}"
}