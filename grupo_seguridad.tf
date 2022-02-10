####Grupo de seguridad ######
resource "openstack_networking_secgroup_v2" "grupo_seguridad" {
  name        = "puertosWeb"
  description = "Grupo de seguridad para servidodr web."
}

# Permitir puerto 80
resource "openstack_networking_secgroup_rule_v2" "puerto_80" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.grupo_seguridad.id}"
}

#Permitir puerto 22
resource "openstack_networking_secgroup_rule_v2" "puerto_22" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.grupo_seguridad.id}"
}

#Permitir puerto imcp
resource "openstack_networking_secgroup_rule_v2" "puerto_icmp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.grupo_seguridad.id}"
}