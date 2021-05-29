resource "oci_core_vcn" "bastion_vcn" {
  cidr_block     = var.bastion_vcn_cidr
  compartment_id = oci_identity_compartment.bastion-compartment.id 
  display_name   = var.bastion_vcn_name
  dns_label      = var.bastion_vcn_dns_label
}

