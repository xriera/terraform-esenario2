#Recuperar id de la Red Externa
data "openstack_networking_network_v2" "network" {
  name = "${var.grupo_ip_flotante}"
}
#Recuperamos la clave publica 
data "openstack_compute_keypair_v2" "clave" {
  name = "${var.keypair_publica}"
}
