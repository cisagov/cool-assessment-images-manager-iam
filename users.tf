# Fetch all users listed in var.production_users and var.staging_users
data "aws_iam_user" "users" {
  provider = aws.users

  for_each = toset(keys(var.users))

  user_name = each.key
}
