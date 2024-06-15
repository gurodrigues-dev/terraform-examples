resource "aws_lb_target_group" "tg" {
  name                          = "corporativo-vpc-endpoint"
  port                          = 443
  protocol                      = "HTTPS"
  vpc_id                        = "vpc-09123c29dfb9650f6"
  ip_address_type               = "ipv4"
  load_balancing_algorithm_type = "round_robin"
  protocol_version              = "HTTP1"
  target_type                   = "ip"

  health_check {
    enabled             = true
    healthy_threshold   = 5
    interval            = 30
    matcher             = "200-499"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTPS"
    timeout             = 5
    unhealthy_threshold = 2
  }

  stickiness {
    cookie_duration = 86400
    enabled         = false
    type            = "lb_cookie"
  }
}

resource "aws_lb_target_group_attachment" "tg-attachment" {
  for_each         = data.aws_network_interface.enis
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = each.value.private_ip
}