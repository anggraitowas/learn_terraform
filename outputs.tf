output "vm1_info" {
  value = {
    name        = google_compute_instance.vm1.name
    zone        = google_compute_instance.vm1.zone
    ip_private  = google_compute_instance.vm1.network_interface[0].network_ip
  }
}

output "vm2_info" {
  value = {
    name        = google_compute_instance.vm2.name
    zone        = google_compute_instance.vm2.zone
    ip_private  = google_compute_instance.vm2.network_interface[0].network_ip
    ip_public   = google_compute_instance.vm2.network_interface[0].access_config[0].nat_ip
  }
}
