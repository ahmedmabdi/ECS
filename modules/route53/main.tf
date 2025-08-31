# Route53 record pointing domain/subdomain to ALB

resource "aws_route53_record" "app" {
  zone_id = "Z103935430WUS287YMWJ6"
  name    = "ahmedumami.click"
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}