locals {
    name                            = "${var.repository.namespace}/${var.repository.name}"
    conditions                      = {
        merge_policies              = var.repository.policy != null
        provision_key               = var.repository.key == null
    }
    encryption_configuration        = local.conditions.provision_key ? (
                                        module.kms[0].key
                                    ) : (
                                        var.repository.key
                                    )
    policy_configuration            = local.conditions.merge_policies ? (
                                        data.aws_iam_policy_document.merged[0]
                                    ) : ( 
                                        data.aws_iam_policy_document.unmerged
                                    )
}