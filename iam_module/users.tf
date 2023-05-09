resource "aws_iam_user" "backend" {
    count = length(var.backend) 
    name = var.backend[count.index]
}

resource "aws_iam_user" "frontend" {
    count = length(var.frontend) 
    name = var.frontend[count.index]
}

resource "aws_iam_user" "sre" {

    count = length(var.sre) 
    name = var.sre[count.index]
}

resource "aws_iam_user" "data" {

    count = length(var.data-engineering) 
    name = var.data-engineering[count.index]
}

resource "aws_iam_user_login_profile" "backend" {
  count = length(var.backend) 
  user    = var.backend[count.index]
  password_reset_required = true
  depends_on = [aws_iam_user.backend]

}

resource "aws_iam_user_login_profile" "frontend" {
  count = length(var.frontend) 
  user    = var.frontend[count.index]
  password_reset_required = true
  depends_on = [aws_iam_user.frontend]
}

resource "aws_iam_user_login_profile" "sre" {
  count = length(var.sre) 
  user    = var.sre[count.index]
  password_reset_required = true
  depends_on = [aws_iam_user.sre]
}


resource "aws_iam_user_login_profile" "data" {
  count = length(var.data-engineering) 
  user    = var.data-engineering[count.index]
  password_reset_required = true
  depends_on = [aws_iam_user.data]
}

