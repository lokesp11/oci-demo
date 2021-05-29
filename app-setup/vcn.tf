resource "oci_core_vcn" "app_vcn" {
  cidr_block     = var.app_vcn_cidr
  compartment_id = oci_identity_compartment.application-compartment.id
  display_name   = var.app_vcn_name
  dns_label      = var.app_vcn_dns_label
}

