# Get Hosted Zone Details
data "aws_route53_zone" "hosted_zone" {
    name = var.Domain_name
}

# Create DNS record
resource "aws_route53_record" "site_domain" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id  
  name    = var.Record_name
  type    = "A"  

  alias {
    name                   = aws_lb.application_load_balancer.dns_name
    zone_id                = aws_lb.application_load_balancer.zone_id
    evaluate_target_health = true
  }     
}