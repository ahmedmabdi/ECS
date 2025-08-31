variable "domain_name" {
  type    = string
  default = ""
}

variable "subject_alternative_names" {
  type    = list(string)
  default = []
}

variable "route53_zone_id" {
  type    = string
  default = ""
}