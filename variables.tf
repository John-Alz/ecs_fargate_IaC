variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "capacity" {
  description = "Nombre del proyecto"
  type        = string
}

variable "env" {
  description = "Ambiente (dev, qa, sbx, stg, pdn)"
  type        = string
}

variable "country" {
  description = "País de despliegue (co, pa, gt, ts)"
  type        = string
}

variable "functionality" {
  description = "Nombre de la aplicación"
  type        = string
}

variable "serviceid" {
  description = "ID del servicio ECS"
  type        = string
}

variable "confidentiality" {
  description = "Clasificación de confidencialidad"
  type        = string
}

variable "integrity" {
  description = "Clasificación de integridad"
  type        = string
}

variable "public_subnet_names" {
  description = "Nombres de las subnets públicas"
  type        = list(string)
}

variable "certificate_domain" {
  description = "Dominio del certificado"
  type        = string
}

variable "container_image" {
  description = "Imagen del contenedor"
  type        = string
}