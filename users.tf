# Fetch all users listed var.users
data "aws_iam_user" "users" {
  provider = aws.users

  for_each = local.users

  user_name = each.value
}
