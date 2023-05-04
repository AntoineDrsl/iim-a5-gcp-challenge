variable "project_id" {
	type = string
	description = "Project ID"
    default = "cours-iim-gcp"
}
variable "region" {
	type = string
	description = "Google cloud region"
    default = "europe-west1"
}
variable "zone" {
	type = string
	description = "Google cloud zone"
    default = "europe-west1-d"
}