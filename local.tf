locals {
    name                            = "${var.repository.namespace}/${var.repository.name}"
    conditions                      = {
        merge_policies              = var.repository.policy != null
        provision_key               = var.repository.key == null
    }
    encryption_configuration        = local.conditions.provision_key ? (
                                        module.kms[0].key.arn 
                                    ) : (
                                        var.repository.key.arn
                                    )
    policy                          = local.conditions.merge_policies ? (
                                        data.aws_iam_policy_document.merged[0].json
                                    ) : ( 
                                        data.aws_iam_policy_document.unmerged.json
                                    )
}