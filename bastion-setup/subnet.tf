resource "oci_core_subnet" "bastion-private-subnet" {
  cidr_block        = var.bastion_vcn_cidr
  display_name      = var.bastion_subnet_name
  dns_label         = var.bastion_subnet_dns_name
  compartment_id    = oci_identity_compartment.bastion-compartment.id
  vcn_id            = oci_core_vcn.bastion_vcn.id
  security_list_ids = [oci_core_vcn.bastion_vcn.default_security_list_id,oci_core_default_security_list.bastion_sec_rules.id]
  route_table_id    = oci_core_vcn.bastion_vcn.default_route_table_id
  dhcp_options_id   = oci_core_vcn.bastion_vcn.default_dhcp_options_id
}
