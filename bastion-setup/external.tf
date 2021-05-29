data "oci_core_images" "ubuntu-18-04-minimal" {
#  compartment_id = oci_identity_compartment.bastion-compartment.id 
  compartment_id = "ocid1.tenancy.oc1..aaaaaaaadvw6fdj4unelrx2sk6sjb7aorcd6uklvb6hcer37xb2vogr7tfya" 
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



output bastion_ip_address {
  value = oci_core_instance.bastion.public_ip
}

