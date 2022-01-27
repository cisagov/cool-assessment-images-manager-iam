# An IAM group for assessment images managers in the Images accounts.
resource "aws_iam_group" "assessment_images_managers" {
  provider = aws.users

  for_each = local.assessment_images_managers_group_name

  name = each.value
}
