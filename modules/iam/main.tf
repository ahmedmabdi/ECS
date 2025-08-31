resource "aws_iam_role" "ecs_execution_role" {
  name               = var.ecs_execution_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_execution_role_policy" {
  role       = aws_iam_role.ecs_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  
}


resource "aws_iam_policy" "ecs_cloudwatch_logging" {
  name        = "ecs-cloudwatch-logging-policy"
  description = "Allows ECS tasks to write to CloudWatch logs"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_execution_logs" {
  role       = aws_iam_role.ecs_execution_role.name
  policy_arn = aws_iam_policy.ecs_cloudwatch_logging.arn
}
resource "aws_iam_policy" "terraform_acm_route53" {
  name        = "terraform-acm-route53-policy"
  description = "Policy for ACM certificate creation and Route53 DNS validation"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect: "Allow",
        Action: [
          "acm:RequestCertificate",
          "acm:DescribeCertificate",
          "acm:ListCertificates",
          "acm:DeleteCertificate",
          "acm:AddTagsToCertificate",
          "acm:ListTagsForCertificate",
          "acm:RenewCertificate",
          "acm:UpdateCertificateOptions",
          "acm:GetCertificate"
        ],
        Resource: "*"
      },
      {
        Effect: "Allow",
        Action: [
          "route53:ListHostedZones",
          "route53:GetChange",
          "route53:ChangeResourceRecordSets",
          "route53:ListResourceRecordSets"
        ],
        Resource: "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "terraform_acm_route53_attach" {
  role       = aws_iam_role.ecs_execution_role.name
  policy_arn = aws_iam_policy.terraform_acm_route53.arn
}