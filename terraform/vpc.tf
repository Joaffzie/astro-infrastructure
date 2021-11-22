variable "project_id" {
    description = "project id"
    default = "astro-app-332210"
}

variable "region" {
    description = "region"
    default = "europe-west3"
}

provider "google" {
    project = var.project_id
    region = var.region
}

resource "google_compute_network" "vpc" {
    name = "${var.project_id}-vpc"
    auto_create_subnetworks = true
}

resource "google_compute_subnetwork" "subnet" {
    name = "${var.project_id}-subnet"
    region = var.region
    network = google_compute_network.vpc.name
    ip_cidr_range = "10.10.0.0/28"      
}