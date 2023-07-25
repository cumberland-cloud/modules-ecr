variable "repository" {
    description         = "ECR configuration object"
    type                = object({
        namespace       = string
        name            = string
        kms_key_arn     = optional(string, null)
        mutability      = optional(string, "MUTABLE")
    })
}