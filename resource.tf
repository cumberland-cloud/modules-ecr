resource "aws_ecr_repository" "this" {
    name                    = local.ecr_name
    image_tag_mutability    = var.ecr.mutability

    image_scanning_configuration {
        scan_on_push        = true
    }

    dynamic "encryption_configuration" {
        for_each            = local.key_map

        content {
            encryption_type = "KMS"
            kms_key         = each.value.arn
        }
    }
}

resource "aws_ecr_repository_policy" "this" {
  repository                = aws_ecr_repository.this.name
  policy                    = local.policy
}