variable "domain_name" {
  description = "The domain name for the application (e.g., demo.mydomain.com)"
  type        = string
  default = "ahmedumami.click"
}

variable "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  type        = string
}

variable "alb_zone_id" {
  description = "The hosted zone ID of the Application Load Balancer"
  type        = string
}

variable "zone_id" {
  description = "The Hosted Zone ID for the domain in Route 53"
  type        = string
}