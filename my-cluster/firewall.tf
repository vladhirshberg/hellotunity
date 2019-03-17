# define firewall rules here
# use firewall/ingress_allow module to allow incoming traffic

module "fw_ssh" {
  source      = "../terraform-modules/firewall/ingress-allow"
  name        = "allow-ssh"
  description = "Allow SSH for everyone"
  network     = "${module.my_network.name}"
  protocol    = "tcp"
  ports       = ["22"]
}

module "fw_http" {
  source      = "../terraform-modules/firewall/ingress-allow"
  name        = "allow-http"
  description = "Allow HTTP for everyone"
  network     = "${module.my_network.name}"
  protocol    = "tcp"
  ports       = ["80"]
}