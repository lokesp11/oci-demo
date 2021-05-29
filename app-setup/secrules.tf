resource "oci_core_default_security_list" "app_sec_rules" {
  compartment_id = oci_identity_compartment.application-compartment.id
 # vcn_id = oci_core_vcn.app_vcn.id
  manage_default_resource_id = oci_core_vcn.app_vcn.default_security_list_id
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }

  ingress_security_rules {
    protocol = "6"
    source   = "172.168.0.0/29"
    tcp_options {
      min = 22
      max = 22
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      min = 80
      max = 80
    }
  }

}


