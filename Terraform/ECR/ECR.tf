resource "aws_ecr_repository" "myrepo" {
  name = "app-repo"
  force_delete = true
  image_scanning_configuration {
    scan_on_push = true
  }
  encryption_configuration {
    encryption_type = "AES256"

  }
}

resource "aws_ecr_lifecycle_policy" "name" {
  repository = aws_ecr_repository.myrepo.name
  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "Keep last 10 images, expire the rest"
      selection = {
        tagStatus   = "any"
        countType   = "imageCountMoreThan"
        countNumber = 10
      }
      action = { type = "expire" }
    }]
  })
}


resource "aws_ecr_repository_policy" "My-Repo-Policy" {
  repository = aws_ecr_repository.myrepo.name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Sid       = "AllowJenkinsAndPrivateEC2"
      Effect    = "Allow"
      Principal = {
        AWS = [
          var.jenkins-ec2-role-arn,var.private-ec2-role-arn
        ]
      }
      Action = [
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "ecr:BatchCheckLayerAvailability",
        "ecr:PutImage",
        "ecr:InitiateLayerUpload",
        "ecr:UploadLayerPart",
        "ecr:CompleteLayerUpload"
      ]
    }]
  })
}