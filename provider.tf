# Definir proveedor
terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.35.0"
    }
  }
}

# Configurar el proveedor de OpenStack
provider "openstack" {
  user_name   = "admin"
  tenant_name = "admin"
  password    = "093f243c0ba848d5"
  auth_url    = "http://172.16.0.9:5000/v3"
  region      = "RegionOne"
  domain_name = "Default"
}
