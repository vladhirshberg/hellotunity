# create network to run cluster instances
module "my_network" {
  source = "../terraform-modules/vpc"
  name   = "${var.ntw_name}"
}

# create cluster
module "my_cluster" {
  source             = "../terraform-modules/cluster"
  name               = "${var.name}"
  description        = "${var.description}"
  zone               = "${var.zone}"
  initial_node_count = "${var.initial_node_count}"
}
