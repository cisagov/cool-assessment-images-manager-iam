# Put assessment images manager users in the appropriate group
resource "aws_iam_user_group_membership" "assessment_images_managers" {
  provider = aws.users

  for_each = local.users

  user = data.aws_iam_user.users[each.value].user_name

  groups = [
    aws_iam_group.assessment_images_managers.name
  ]
}
