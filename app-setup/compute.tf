resource "oci_core_instance" "application" {
  compartment_id      = oci_identity_compartment.application-compartment.id
  availability_domain = "iYqy:AP-TOKYO-1-AD-1" 
  display_name        = var.app_hostname
  shape               = var.app_shape

  create_vnic_details {
    subnet_id        = oci_core_subnet.app-private-subnet.id
    display_name     = format("%s-nic01", var.app_hostname)
    assign_public_ip = false 
    hostname_label   = var.app_hostname
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

resource "null_resource" "remote-exec" {

  provisioner "file" {
     connection {
      agent       = false
      timeout     = "3m"
      host        = oci_core_instance.application.private_ip
      user        = "opc"
      private_key = file(var.ssh_priv_key)
    }

    source      = "install-packages.sh"
    destination = "/tmp/"
  }


  provisioner "remote-exec" {
    connection {
      agent       = false
      timeout     = "3m"
      host        = oci_core_instance.application.private_ip
      user        = "opc"
      private_key = file(var.ssh_priv_key)
    }

    inline = [
        "sudo chmod 755 /tmp/install-packages.sh",
        "sudo /tmp/install-packages.sh"
    ]
  }
}
