resource "oci_identity_compartment" "application-compartment" {
    compartment_id = var.tenancy-ocid
    description = "Compartment for Application resources."
    name = "Application"
}

