variable "public_subnet_names" {
  description = "public subnets name"
  type = list(string)
}

variable "certificate_domain" {
  description = "SSL certificate domain name"
  type = string
}