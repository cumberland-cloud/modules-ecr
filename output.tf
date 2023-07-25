output "repository" {
    value           = {
        arn         = aws_ecr_repository.this.arn
        url         = aws_ecr_repository.this.repository_url
    }
}