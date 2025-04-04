# Put assessment images manager users in the appropriate group
resource "aws_iam_user_group_membership" "assessment_images_managers" {
  provider = aws.users

  for_each = toset(var.users)

  groups = [
    aws_iam_group.assessment_images_managers.name
  ]
  user = data.aws_iam_user.users[each.key].user_name
}
