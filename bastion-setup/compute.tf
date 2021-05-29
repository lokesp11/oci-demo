resource "oci_core_instance" "bastion" {
  compartment_id      = oci_identity_compartment.bastion-compartment.id
  availability_domain = "iYqy:AP-TOKYO-1-AD-1" 
  display_name        = var.bastion_hostname
  shape               = var.bastion_shape

  create_vnic_details {
    subnet_id        = oci_core_subnet.bastion-private-subnet.id
    display_name     = format("%s-nic01", var.bastion_hostname)
    assign_public_ip = true
    hostname_label   = var.bastion_hostname
  }
   source_details {
    source_type = "image"
    source_id   = data.oci_core_images.ubuntu-18-04-minimal.images.0.id
  }
  metadata = {
    ssh_authorized_keys = file(var.ssh_pub_key)
    
  }
  timeouts {
    create = "60m"
  }
}

