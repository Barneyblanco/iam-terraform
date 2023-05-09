output "frontend_users_password" {
  value = {for i in aws_iam_user_login_profile.frontend : i.user => i.password}
  sensitive = true
}

output "backend_users_password" {
  value = {for i in aws_iam_user_login_profile.backend : i.user => i.password}
  sensitive = true
}

output "sre_users_password" {
  value = {for i in aws_iam_user_login_profile.sre : i.user => i.password}
  sensitive = true
}

output "data_users_password" {
  value = {for i in aws_iam_user_login_profile.data : i.user => i.password}
  sensitive = true
}