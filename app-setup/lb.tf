resource "oci_load_balancer_load_balancer" "test_load_balancer" {
    #Required
    compartment_id = oci_identity_compartment.application-compartment.id
    display_name = "app-lb"
    shape = "100Mbps"
    subnet_ids = [oci_core_subnet.app-private-subnet.id]

    #Optional
    is_private = false
    #network_security_group_ids = var.load_balancer_network_security_group_ids
}

resource "oci_load_balancer_backend_set" "app" {
  health_checker {
    protocol = "TCP"
	port     = "8080"
  }
  load_balancer_id = oci_load_balancer_load_balancer.test_load_balancer.id
  name             = "aap-bks"
  policy           = "ROUND_ROBIN"
}

resource "oci_load_balancer_backend" "app" {
  backendset_name  = oci_load_balancer_backend_set.app.name
  ip_address       = oci_core_instance.application.private_ip
  load_balancer_id = oci_load_balancer_load_balancer.test_load_balancer.id
  port             = var.app_port
}




resource "oci_load_balancer_listener" "app_listener" {
	#Required
	default_backend_set_name = oci_load_balancer_backend_set.app.name
	load_balancer_id = oci_load_balancer_load_balancer.test_load_balancer.id
	name = var.app_listener_name
	port = var.app_listener_port
	protocol = "TCP"
}
