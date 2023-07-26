locals {
    name                            = "${var.repository.namespace}/${var.repository.name}"
    conditions                      = {
        merge_policies              = var.repository.policy != null
        provision_key               = var.repository.kms_key_arn == null
    }
    encryption_configuration        = local.conditions.provision_key ? (
                                        module.kms[0].key.arn 
                                    ) : (
                                        var.repository.kms_key_arn
                                    )
    policy                          = local.conditions.merge_policies ? (
                                        data.aws_iam_policy_document.merged[0].json :
                                    ) : ( 
                                        data.aws_iam_policy_document.unmerged.json
                                    )
}