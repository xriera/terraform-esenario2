#Recuperamos la clave publica 
data "openstack_compute_keypair_v2" "clave" {
  name = "${var.keypair_publica}"
}