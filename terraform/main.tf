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
}
module "google-cloud-function" {
    source = "./modules/google-cloud-function"
}