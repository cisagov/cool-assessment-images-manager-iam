# Fetch all users listed in var.users
data "aws_iam_user" "users" {
  provider = aws.users

  for_each = toset(var.users)

  user_name = each.key
}
