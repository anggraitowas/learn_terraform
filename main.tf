# Membuat Custom VPC bukan Default
resource "google_compute_network" "custom_vpc" {
  name                    = "anggraitowas-custom-vpc"
  auto_create_subnetworks  = false
}
resource "google_compute_subnetwork" "subnet" {
  name          = "anggraitowas-custom-subnet"
  network       = google_compute_network.custom_vpc.id
  ip_cidr_range = "172.16.0.0/16"
  region        = "asia-southeast2"
}
#Membuat VM 1 tanpa ip public
resource "google_compute_instance" "vm1" {
  name         = "anggraitowas-program"
  machine_type = "e2-small"
  zone         = "asia-southeast2-a"

#   tags = ["foo", "bar"]
# Membuat boot disk dengan ketentuan Ubuntu 2204 dengan 30GB Disk
  boot_disk {
    initialize_params {
      image = "ubuntu-2204-jammy-v20250128"
      size = 30 # Ukuran Disk
    }
  }

  network_interface {
    network    = google_compute_network.custom_vpc.name
    subnetwork = google_compute_subnetwork.subnet.name
   }
}
resource "google_compute_instance" "vm2" {
  name         = "anggraitowas-webserver"
  machine_type = "e2-small"
  zone         = "asia-southeast2-a"

  tags = ["webserver"]

  boot_disk {
    initialize_params {
      image = "ubuntu-2204-jammy-v20250128"
      size = 30
    }
  }
  
  network_interface {
    network    = google_compute_network.custom_vpc.name
    subnetwork = google_compute_subnetwork.subnet.name
    access_config {
      // IP Publik NAT
    }
    
  }
  
}
resource "google_compute_firewall" "allow_http" {
  name    = "anggra-allow-http"
  network = google_compute_network.custom_vpc.id

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["webserver"]
}
