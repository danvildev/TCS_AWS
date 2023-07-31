 
resource "aws_route53_zone" "example_zone" {
  name = "example.com."
}

# Crear el registro DNS con alias (A) que apunta a un Load Balancer de Elastic Beanstalk, por ejemplo
resource "aws_route53_record" "alias_record" {
  zone_id = aws_route53_zone.example_zone.zone_id
  name    = "www.example.com"
  type    = "A"

  alias {
    name                   = "my-load-balancer-1234567890.us-west-2.elb.amazonaws.com"
    zone_id                = "Z3AQBSTGFYJSTF"   
    evaluate_target_health = true
  }
}