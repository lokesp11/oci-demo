resource "oci_core_subnet" "app-private-subnet" {
  cidr_block        = var.app_vcn_cidr
  display_name      = var.app_subnet_name
  dns_label         = var.app_subnet_dns_name
  compartment_id    = oci_identity_compartment.application-compartment.id
  vcn_id            = oci_core_vcn.app_vcn.id
  security_list_ids = [oci_core_vcn.app_vcn.default_security_list_id,oci_core_default_security_list.app_sec_rules.id]
  route_table_id    = oci_core_vcn.app_vcn.default_route_table_id
  dhcp_options_id   = oci_core_vcn.app_vcn.default_dhcp_options_id
}
