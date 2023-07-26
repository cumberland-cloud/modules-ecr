config {
  format            = "compact"
  module            = true
}

plugin "aws" {
  enabled           = true
  version           = "0.24.3"
  source            = "github.com/terraform-linters/tflint-ruleset-aws"
}

rule "aws_instance_invalid_type" {
    enabled         = false
}

rule "aws_ecr_enforce_immutable_repository" {
    enabled         = false
}