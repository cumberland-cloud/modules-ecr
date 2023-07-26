module "kms" {
    count           = local.conditions.provision_key ? 1 : 0
    source          = "https://github.com/cumberland-cloud/modules-kms.git?ref=v1.0.0"

    key             = {
        alias       = "${local.name}-ecr"
    }
}