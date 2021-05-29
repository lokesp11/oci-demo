resource "oci_identity_compartment" "bastion-compartment" {
    compartment_id = var.tenancy-ocid
    description = "Compartment for Bastion resources."
    name = "Bastion"
}


