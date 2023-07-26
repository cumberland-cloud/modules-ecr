module "kms" {
    count           = local.conditions.provision_key ? 1 : 0
    source          = "https://github.com/cumberland-cloud/modules-kms.git?ref=master"

    key             = {
        alias       = "${local.name}-ecr"
    }
}