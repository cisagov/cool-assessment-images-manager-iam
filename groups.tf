# An IAM group for assessment images managers in the Images account.
resource "aws_iam_group" "assessment_images_managers" {
  provider = aws.users

  name = var.assessment_images_managers_group_name
}
