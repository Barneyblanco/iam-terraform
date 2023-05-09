resource "aws_iam_group" "backend" {
 name = "Backend"
}

resource "aws_iam_group" "sre" {
 name = "sre"
}

resource "aws_iam_group" "frontend" {
 name = "Frontend"
}

resource "aws_iam_group" "data" {
 name = "data-engineering"
}

resource "aws_iam_group_membership" "sre" {  
  name = "sre-membership"

  users = var.sre

  group = aws_iam_group.sre.name
}

resource "aws_iam_group_membership" "backend" {
  name = "backend-membership"

  users = var.backend

  group = aws_iam_group.backend.name
}

resource "aws_iam_group_membership" "frontend" {
  name = "frontend-membership"

  users = var.frontend

  group = aws_iam_group.frontend.name
}

resource "aws_iam_group_membership" "data" {
  name = "data-engineering-membership"

  users = var.data-engineering

  group = aws_iam_group.data.name
}