resource "oci_load_balancer_backend_set" "grafana" {
  health_checker {
    protocol = "TCP"
	port     = var.grafana_port 
  }
  load_balancer_id = data.oci_load_balancer_load_balancers.test_load_balancers.id 
  name             = "grafana-bks"
  policy           = "ROUND_ROBIN"
}

resource "oci_load_balancer_backend" "app" {
  backendset_name  = oci_load_balancer_backend_set.grafana.name
  ip_address       = oci_core_instance.grafana.private_ip
  load_balancer_id = data.oci_load_balancer_load_balancers.test_load_balancers.id 
  port             = var.grafana_port
}

resource "oci_load_balancer_listener" "app_listener" {
	#Required
	default_backend_set_name = oci_load_balancer_backend_set.grafana.name
	load_balancer_id = data.oci_load_balancer_load_balancers.test_load_balancers.id 
	name = var.grafana_listener_name
	port = var.grafana_listener_port
	protocol = "TCP"
}
