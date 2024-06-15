resource "aws_lb" "lb-internal" {
  name                       = "corporativo-api-internal"
  internal                   = true
  load_balancer_type         = "application"
  security_groups            = ["sg-xxxxx"]
  subnets                    = ["subnet-<private-1>", "subnet-<private-2>"]
  preserve_host_header       = false
  xff_header_processing_mode = "preserve"
  tags = {
    terraform = true
  }
}

resource "aws_lb_listener" "listener-https" {
  load_balancer_arn = aws_lb.lb-internal.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn   = "arn:aws:acm:us-east-1:<number-account>:certificate/<uuid-certificate>"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

resource "aws_lb_listener" "listener-http" {
  load_balancer_arn = aws_lb.lb-internal.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}