provider "oci" {
#insert tenancy ocid details below
  tenancy_ocid = "ocid1.tenancy.oc1................"
#insert user ocid details below
  user_ocid = "ocid1.user.oc1..............."
#insert private key details for authentication
  private_key_path = "/dummy/tf-build.pem"
#insert fingerprint of key used above
  fingerprint = "u6:hd:61:3a:97:8e:c2:77:12:5f:84:3a:b8:09:09:4d"
  region = "ap-tokyo-1"
}
