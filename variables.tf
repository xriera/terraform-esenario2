variable "instancia_num" {
    description = "Numero de instancias a crear."
    default  = "3"
}
variable "instancia_nombre" {
    description = "Nombre de la instancia."
    default  = "srv"
}
variable "imagen_id" {
    description = "ID de la imagen."
    default  = "cc7c5431-b296-43b5-9ee3-caf1e0132c1a"
}
variable "sabor_id" {
    description = "Id de sabor que se utilizara."
    default  = "2"
}
variable "volumen_tamano" {
    description = "Tamaño del volumen"
    default  = "10"
}
variable "nombre_red_interna" {
    description = "Red que se conectara con el internet."
    default  = "Red_1"
}
variable "subred_interna" {
    description = "Nombre de la subred interna."
    default  = "RedSub_1"
}
variable "red_ip" {
    description = "Ip que tendra la red."
    default  = "10.10.10.0/24"
}
variable "router" {
    description = "Nombre del router"
    default  = "router_1"
}
variable "grupo_ip_flotante" {
    description = "El grupo de red que se utilizará para obtener ip flotante"
    default  = "RedExterna"
}
variable "keypair_publica" {
    description = "Nombre de la clave publica en openstack."
    default  = "clave"
}
variable "AUTH_URL" {}
variable "USUARIO" {}
variable "PASSWORD" {}