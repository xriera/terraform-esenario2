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
  user_name   = var.USUARIO
  tenant_name = var.USUARIO
  password    = var.PASSWORD
  auth_url    = var.AUTH_URL
  region      = "RegionOne"
  domain_name = "Default"
}
