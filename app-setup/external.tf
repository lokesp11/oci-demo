data "oci_core_images" "ubuntu-18-04-minimal" {
# insert root compartment id below 
  compartment_id = "ocid1.tenancy.oc1..............".
  operating_system = "Canonical Ubuntu"
  filter {
    name = "display_name"
    values = ["^Canonical-Ubuntu-18.04-Minimal-([\\.0-9-]+)$"]
    regex  = true
  }
}
output "ubuntu-18-04-minimal-latest-name" {
  value = data.oci_core_images.ubuntu-18-04-minimal.images.0.display_name
}
output "ubuntu-16-04-minimal-latest-id" {
  value = data.oci_core_images.ubuntu-18-04-minimal.images.0.id
}


output app_ip_address {
  value = oci_core_instance.application.private_ip
}


output loadbalancer_ip_address {
  value = oci_load_balancer_load_balancer.test_load_balancer.ip_address_details
}


