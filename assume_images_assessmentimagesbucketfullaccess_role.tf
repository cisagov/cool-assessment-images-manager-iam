# IAM policy document that allows assumption of the
# AssessmentImagesBucketFullAccess role in the Images account.
data "aws_iam_policy_document" "assume_images_assessmentimagesbucketfullaccess_role_doc" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
      "sts:TagSession",
    ]

    resources = [
      data.terraform_remote_state.assessment_images.outputs.assessmentimagesbucketfullaccess_role.arn,
    ]
  }
}

resource "aws_iam_policy" "assume_images_assessmentimagesbucketfullaccess_role" {
  provider = aws.users

  description = var.assume_images_assessmentimagesbucketfullaccess_policy_description
  name        = local.assume_assessmentimagesbucketfullaccess_policy_name
  policy      = data.aws_iam_policy_document.assume_images_assessmentimagesbucketfullaccess_role_doc.json
}

# Attach the policy to the Production assessment images managers group
resource "aws_iam_group_policy_attachment" "assume_images_assessmentimagesbucketfullaccess_role_attachment" {
  provider = aws.users

  group      = aws_iam_group.assessment_images_managers.name
  policy_arn = aws_iam_policy.assume_images_assessmentimagesbucketfullaccess_role.arn
}
