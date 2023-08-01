resource "aws_ecr_repository" "this" {
    name                    = local.name
    image_tag_mutability    = var.repository.mutability

    image_scanning_configuration {
        scan_on_push        = true
    }

    dynamic "encryption_configuration" {
        for_each            = local.encryption_configuration

        content {
            encryption_type = "KMS"
            kms_key         = encryption_configuration.value["arn"]
        }
    }
}

resource "aws_ecr_repository_policy" "this" {
  repository                = aws_ecr_repository.this.name
  policy                    = local.policy_configuration.json
}