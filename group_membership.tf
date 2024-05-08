# Put assessment images manager users in the appropriate group
resource "aws_iam_user_group_membership" "assessment_images_managers_production" {
  provider = aws.users

  for_each = local.assessment_images_managers["production"]

  groups = [
    aws_iam_group.assessment_images_managers["production"].name
  ]
  user = data.aws_iam_user.users[each.value].user_name
}

resource "aws_iam_user_group_membership" "assessment_images_managers_staging" {
  provider = aws.users

  for_each = local.assessment_images_managers["staging"]

  groups = [
    aws_iam_group.assessment_images_managers["staging"].name
  ]
  user = data.aws_iam_user.users[each.value].user_name
}
