#Creamos la red interna 
resource "openstack_networking_network_v2" "red_interna" {
  name           = "${var.nombre_red_interna}"
  admin_state_up = "true"
}
#Creamos la sub red interna 
resource "openstack_networking_subnet_v2" "sub_red" {
  name            = "${var.subred_interna}"
  network_id      = openstack_networking_network_v2.red_interna.id
  cidr            = "${var.red_ip}"
  ip_version      = 4
  dns_nameservers = ["8.8.8.8", "8.8.4.4"]
}
#creamos el router
resource "openstack_networking_router_v2" "router_1" {
  name                = "${var.router}"
  external_network_id = "16168b9c-c8cb-4d10-9ab8-43a91aaa556b"
}
#Realizamos la conecion el router con la sub red 
resource "openstack_networking_router_interface_v2" "router_interface" {
  router_id = openstack_networking_router_v2.router_1.id
  subnet_id = openstack_networking_subnet_v2.sub_red.id
}
resource "openstack_compute_instance_v2" "srv_instancia" {
  count = var.instancia_num
  name = format("%s-%02d", var.instancia_nombre, count.index+1)
  image_id = var.imagen_id
  flavor_id = var.sabor_id
  key_pair = data.openstack_compute_keypair_v2.clave.name
  security_groups = ["${openstack_networking_secgroup_v2.grupo_seguridad.name}"]
  network {
    name = openstack_networking_network_v2.red_interna.name
  }
}
#Crear Volumen
resource "openstack_blockstorage_volume_v2" "volumen" {
  count = var.instancia_num
  name = format("volumen-%02d", count.index+1)
  size = "${var.volumen_tamano}"
}
#Asociar volumen a la instancia 
resource "openstack_compute_volume_attach_v2" "attached" {
  count = var.instancia_num
  instance_id = element(openstack_compute_instance_v2.srv_instancia.*.id, count.index)
  volume_id   = element(openstack_blockstorage_volume_v2.volumen.*.id, count.index)
}

resource "openstack_networking_floatingip_v2" "fip" {
  count = var.instancia_num
  pool = var.grupo_ip_flotante
}

resource "openstack_compute_floatingip_associate_v2" "fip" {
  count = var.instancia_num
  floating_ip = element(openstack_networking_floatingip_v2.fip.*.address, count.index)
  instance_id = element(openstack_compute_instance_v2.srv_instancia.*.id, count.index)
}


