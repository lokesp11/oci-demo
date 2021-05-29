
resource "oci_core_default_security_list" "bastion_sec_rules" {
  compartment_id = oci_identity_compartment.bastion-compartment.id
 #vcn_id = oci_core_vcn.bastion_vcn.id
  manage_default_resource_id = oci_core_vcn.bastion_vcn.default_security_list_id
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"
    tcp_options {
      min = 22
      max = 22
    }
  }
}
