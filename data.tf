data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_iam_policy_document" "merged" {
    count                   = local.merge ? 1 : 0

    source_policy_documents = [
        aws_iam_policy_document.unmerged.json,
        var.ecr.policy
    ]
}

data "aws_iam_policy_document" "unmerged" {
  statement {
    sid                     = "EnableAuth"
    effect                  = "Allow"
    actions                 = [ "ecr:GetAuthorizationToken" ]
    resources               = [ "*" ]

    principals {
      type                  =  "AWS"
      identifiers           = [
        "arn:aws:iam::${data.aws_caller_identity.account_id}:root"
      ]
    }
  }

  statement {
    sid                     = "EnableAccess"
    effect                  = "Allow"
    actions                 = [
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
      "ecr:CompleteLayerUpload",
      "ecr:GetDownloadUrlForLayer",
      "ecr:InitiateLayerUpload",
      "ecr:PutImage",
      "ecr:UploadLayerPart"
    ]
    resources               = [ "*" ]

    principals {
      type                  =  "AWS"
      identifiers           = [
        "arn:aws:iam::${data.aws_caller_identity.account_id}:root"
      ]
    }
  }
}