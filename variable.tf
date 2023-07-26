variable "repository" {
    description         = "ECR configuration object. Policy should be a JSON string and will default to allowing all users in the caller account READ/WRITE access to the ECR."
    type                = object({
        namespace       = string
        name            = string
        kms_key_arn     = optional(string, null)
        mutability      = optional(string, "MUTABLE")
        policy          = optional(string, null)
    })
}