variable "vpc_id" {}
variable "security_group_id" {}
variable "public_subnet_zone1_id" {}
variable "public_subnet_zone2_id" {}


resource "aws_lb" "alb" {
  name               = "applicationloadbalancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = [
    var.public_subnet_zone1_id,
    var.public_subnet_zone2_id,
  ]

  tags = {
    Name = "ALB"
  }
}

resource "aws_lb_target_group" "target_group" {
  name     = "tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}

output "alb_dns_name" {
  value = aws_lb.alb.dns_name
}