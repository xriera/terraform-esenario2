output "float_ips" {
    value = {
       for fip in openstack_networking_floatingip_v2.fip:
          fip.fixed_ip => fip.address
    }
}