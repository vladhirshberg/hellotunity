resource "google_dns_managed_zone" "primary" {
  name        = "tunity-zone"
  dns_name    = "tunity.test"
  description = "DNS zone for the Tunity Asignment domain"
}

resource "google_dns_record_set" "a_tunity" {
  name = "${google_dns_managed_zone.primary.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = "${google_dns_managed_zone.primary.name}"

  rrdatas = ["${google_compute_global_address.tunity_static_ip.address}"]
}

resource "google_dns_record_set" "cname_tunity" {
  name = "www.${google_dns_managed_zone.primary.dns_name}"
  type = "CNAME"
  ttl  = 300

  managed_zone = "${google_dns_managed_zone.primary.name}"

  rrdatas = ["${google_dns_managed_zone.primary.dns_name}"]
}

