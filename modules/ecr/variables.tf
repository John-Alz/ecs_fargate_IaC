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