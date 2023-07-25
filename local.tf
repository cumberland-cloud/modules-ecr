locals {
    ecr_name        = "${var.repository.namespace}/${var.repository.name}"
    ecr_arn         = "arn:aws:ecr:${data.aws_region.current.name}:${data.aws_caller_identity.account_id}:${local.ecr_name}"
    encrypt_map     = try({
        arn         = var.ecr.kms_key_arn
    }, {})
    merge       = var.ecr.policy != null
    policy      = local.merge ? data.aws_iam_policy_document.merged[0].json : data.aws_iam_policy_document.unmerged.json
}