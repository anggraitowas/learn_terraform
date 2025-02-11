terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.20.0"
    }
  }
}

provider "google" {
  project = "mentoring-batch-1"
  region  = "asia-southeast2"
  credentials = "./credentials.json"
}

# resource "google_compute_subnetwork" "subnet_vm1" {
#   name          = "subnet-vm1"
#   region        = "us-central1"
#   network       = google_compute_network.custom_vpc.id
#   ip_cidr_range = "172.17.20.0/24"  # Private IP range for VM 1
# }
# resource "google_compute_subnetwork" "subnet_vm2" {
#   name          = "subnet-vm2"
#   region        = "us-central1"
#   network       = google_compute_network.custom_vpc.id
#   ip_cidr_range = "172.17.21.0/24"  # Private IP range for VM 2
# }



# resource "google_compute_firewall" "allow_http_webserver" {
#   name    = "allow-http-webserver"
#   network = "default"  # The network where the firewall rule will be applied

#   allow {
#     protocol = "tcp"
#     ports    = ["80"]  # Allow HTTP traffic on port 80
#   }

#   source_ranges = ["0.0.0.0/0"]  # Allow from anywhere (can be restricted if needed)
#   direction     = "INGRESS"      # Incoming traffic
#   priority      = 1000           # Firewall rule priority
#   target_tags   = ["webserver"]  # Apply the rule only to instances with the 'webserver' tag
# }


