data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "merged" {
    count                   = local.conditions.merge_policies ? 1 : 0

    source_policy_documents = [
        data.aws_iam_policy_document.unmerged.json,
        var.repository.policy
    ]
}

data "aws_iam_policy_document" "unmerged" {
  #checkov:skip=CKV_AWS_356: "Ensure no IAM policies documents allow "*" as a statement's resource for restrictable actions"

  statement {
    sid                     = "EnableAccess"
    effect                  = "Allow"
    actions                 = [
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
      "ecr:CompleteLayerUpload",
      "ecr:Get*",
      "ecr:Describe*",
      "ecr:InitiateLayerUpload",
      "ecr:List*",
      "ecr:PutImage",
      "ecr:UploadLayerPart"
    ]
    
    principals {
      type                  =  "AWS"
      identifiers           = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      ]
    }
  }
}