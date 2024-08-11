# waf.tf
resource "aws_wafv2_web_acl" "web_acl" {
  name        = "${var.project_name}-web-acl"
  scope       = "REGIONAL" # Use "CLOUDFRONT" for global
  default_action {
    allow {}
  }
  visibility_config {
    sampled_requests_enabled = true
    cloudwatch_metrics_enabled = true
    metric_name = "${var.project_name}-web-acl"
  }

  rule {
    name     = "IPBlockRule"
    priority = 1
    action {
      block {}
    }
    statement {
      ip_set_reference_statement {
        arn = aws_wafv2_ip_set.blocklist.arn
      }
    }
    visibility_config {
      sampled_requests_enabled = true
      cloudwatch_metrics_enabled = true
      metric_name = "IPBlockRule"
    }
  }
}

resource "aws_wafv2_ip_set" "blocklist" {
  name               = "${var.project_name}-ip-blocklist"
  scope              = "REGIONAL"
  ip_address_version = "IPV4"

  addresses = [
    "192.168.0.1/32",
    "10.0.0.0/8"
  ]
}
