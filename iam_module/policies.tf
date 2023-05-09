resource "aws_iam_group_policy_attachment" "sre" {
  group      = aws_iam_group.sre.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_group_policy_attachment" "backend" {
  group      = aws_iam_group.backend.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_group_policy_attachment" "frontend" {
  group      = aws_iam_group.frontend.name
  policy_arn = "arn:aws:iam::aws:policy/CloudFrontFullAccess"
}

resource "aws_iam_group_policy_attachment" "data" {
  group      = aws_iam_group.data.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRedshiftFullAccess"
}