resource "aws_wafv2_web_acl" "waf-example-name" {
  name          = "waf-example-name"
  scope         = "REGIONAL"

  default_action {
    allow {}
  }

  rule {
    name     = "country-deny"
    priority = 3

    action {
      block {}
    }

    statement {
      geo_match_statement {
        country_codes = [
          "AF",
          "BY",
          "CU",
          "GN",
          "GW",
          "IR",
          "IQ",
          "KR",
          "LB",
          "LY",
          "ML",
          "MM",
          "NI",
          "RU",
          "SO",
          "SS",
          "SD",
          "SY",
          "UA",
          "VE",
          "YE",
        ]
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "country-deny"
      sampled_requests_enabled   = true
    }
  }



  rule {
    name     = "limit-of-requests"
    priority = 4

    action {
      block {}
    }

    statement {
      rate_based_statement {
        aggregate_key_type = "IP"
        limit              = 200000
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "limit-of-requests"
      sampled_requests_enabled   = true
    }
  }

 

  rule {
    name     = "AWS-AWSManagedRulesAmazonIpReputationList"
    priority = 1

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesAmazonIpReputationList"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWS-AWSManagedRulesAmazonIpReputationList"
      sampled_requests_enabled   = true
    }
  }

  rule {
    name     = "AWS-AWSManagedRulesAnonymousIpList"
    priority = 2

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesAnonymousIpList"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWS-AWSManagedRulesAnonymousIpList"
      sampled_requests_enabled   = true
    }
  }

  rule {
    name     = "AWS-AWSManagedRulesKnownBadInputsRuleSet"
    priority = 5

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesKnownBadInputsRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWS-AWSManagedRulesKnownBadInputsRuleSet"
      sampled_requests_enabled   = true
    }
  }


  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "waf-example-name"
    sampled_requests_enabled   = true
  }

  tags = {
    "terraform" = "true"
  }
}