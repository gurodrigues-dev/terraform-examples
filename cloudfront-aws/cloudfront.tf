resource "aws_cloudfront_distribution" "cloudfront" {
  aliases = [
    "custom-domain-here",
  ]
  comment          = "custom-domain-here"
  enabled          = true
  http_version     = "http2"
  is_ipv6_enabled  = false
  price_class      = "PriceClass_All"
  retain_on_delete = false

  tags = {
    terraform = true
  }
  tags_all = {
    terraform = true
  }

  wait_for_deployment = true

  default_cache_behavior {
    allowed_methods = [
      "DELETE",
      "GET",
      "HEAD",
      "OPTIONS",
      "PATCH",
      "POST",
      "PUT",
    ]
    cache_policy_id = "your-cache-policy-id-here"
    cached_methods = [
      "GET",
      "HEAD",
      "OPTIONS",
    ]
    compress                   = true
    default_ttl                = 0
    max_ttl                    = 0
    min_ttl                    = 0
    origin_request_policy_id   = "your-origin-request-policy-id-here"
    response_headers_policy_id = "your-origin-response-headers-id-here"
    smooth_streaming           = false
    target_origin_id            = "your-elastic-load-balancer-name-here"
    trusted_key_groups         = []
    trusted_signers            = []
    viewer_protocol_policy     = "redirect-to-https"
  }

  ordered_cache_behavior {
    allowed_methods = [
      "DELETE",
      "GET",
      "HEAD",
      "OPTIONS",
      "PATCH",
      "POST",
      "PUT",
    ]
    cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    cached_methods = [
      "GET",
      "HEAD",
      "OPTIONS",
    ]
    compress                   = true
    default_ttl                = 0
    max_ttl                    = 0
    min_ttl                    = 0
    origin_request_policy_id   = "your-origin-request-policy-id-here"
    path_pattern               = "your-endpoint"
    response_headers_policy_id = "your-response-headers-policy-id"
    smooth_streaming           = false
    target_origin_id           = "your-elastic-load-balancer-name-here"
    trusted_key_groups         = []
    trusted_signers            = []
    viewer_protocol_policy     = "redirect-to-https"
  }

  origin {
    connection_attempts = 3
    connection_timeout  = 10
    domain_name         = "your-domain-alb"
    origin_id           = "your-elastic-load-balancer-name-here"

    custom_origin_config {
      http_port                = 80
      https_port               = 443
      origin_keepalive_timeout = 5
      origin_protocol_policy   = "https-only"
      origin_read_timeout      = 30
      origin_ssl_protocols = [
        "TLSv1.2",
      ]
    }
  }


  restrictions {
    geo_restriction {
      locations        = []
      restriction_type = "none"
    }
  }
  viewer_certificate {
    acm_certificate_arn            = "your-acm-certificate"
    cloudfront_default_certificate = false
    minimum_protocol_version       = "TLSv1.2_2021"
    ssl_support_method             = "sni-only"
  }
}
