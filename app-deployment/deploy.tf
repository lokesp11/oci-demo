
resource "null_resource" "remote-exec" {

  provisioner "file" {
     connection {
      agent       = false
      timeout     = "3m"
      host        = var.application_ip
      user        = "opc"
      private_key = file(var.ssh_priv_key)
    }

    source      = "deploy-app.sh"
    destination = "/tmp/"
  }


  provisioner "remote-exec" {
    connection {
      agent       = false
      timeout     = "3m"
      host        = var.application_ip 
      user        = "opc"
      private_key = file(var.ssh_priv_key)
    }

    inline = [
        "sudo chmod 755 /tmp/deploy-app.sh",
        "sudo /tmp/deploy-app.sh"
    ]
  }
}
