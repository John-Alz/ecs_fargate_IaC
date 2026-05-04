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

variable "vpc_id" {
  description = "ID de la VPC donde se creará el cluster"
  type        = string
}

variable "subnet_ids" {
  description = "IDs de las subnets donde se creará el cluster"
  type        = list(string)
}

variable "certificate_arn" {
  description = "ARN del certificado SSL"
  type        = string
}