locals {
    name                            = "${var.repository.namespace}/${var.repository.name}"
    encryption_configuration        = try({
        arn                         = var.repository.kms_key_arn
    }, {})
    merge                           = var.repository.policy != null
    policy                          = local.merge ? data.aws_iam_policy_document.merged[0].json : data.aws_iam_policy_document.unmerged.json
}