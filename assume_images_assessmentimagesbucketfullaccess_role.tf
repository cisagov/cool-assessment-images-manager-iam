# IAM policy document that allows assumption of the
# AssessmentImagesBucketFullAccess role in the Images (Production) account
data "aws_iam_policy_document" "assume_images_assessmentimagesbucketfullaccess_role_production_doc" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
      "sts:TagSession",
    ]

    resources = [
      data.terraform_remote_state.assessment_images.outputs.assessmentimagesbucketfullaccess_role_production.arn,
    ]
  }
}

resource "aws_iam_policy" "assume_images_assessmentimagesbucketfullaccess_role_production" {
  provider = aws.users

  description = var.assume_images_assessmentimagesbucketfullaccess_policy_description
  name        = var.assume_images_assessmentimagesbucketfullaccess_policy_name
  policy      = data.aws_iam_policy_document.assume_images_assessmentimagesbucketfullaccess_role_production_doc.json
}

# Attach the policy to the Production assessment images managers group
resource "aws_iam_group_policy_attachment" "assume_images_assessmentimagesbucketfullaccess_role_production_attachment" {
  provider = aws.users

  group      = aws_iam_group.assessment_images_managers["production"].name
  policy_arn = aws_iam_policy.assume_images_assessmentimagesbucketfullaccess_role_production.arn
}

# IAM policy document that allows assumption of the
# AssessmentImagesBucketFullAccess role in the Images (Staging) account
data "aws_iam_policy_document" "assume_images_assessmentimagesbucketfullaccess_role_staging_doc" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
      "sts:TagSession",
    ]

    resources = [
      data.terraform_remote_state.assessment_images.outputs.assessmentimagesbucketfullaccess_role_staging.arn,
    ]
  }
}

resource "aws_iam_policy" "assume_images_assessmentimagesbucketfullaccess_role_staging" {
  provider = aws.users

  description = var.assume_images_assessmentimagesbucketfullaccess_policy_description
  name        = var.assume_images_assessmentimagesbucketfullaccess_policy_name
  policy      = data.aws_iam_policy_document.assume_images_assessmentimagesbucketfullaccess_role_staging_doc.json
}

# Attach the policy to the Staging assessment images managers group
resource "aws_iam_group_policy_attachment" "assume_images_assessmentimagesbucketfullaccess_role_staging_attachment" {
  provider = aws.users

  group      = aws_iam_group.assessment_images_managers["staging"].name
  policy_arn = aws_iam_policy.assume_images_assessmentimagesbucketfullaccess_role_staging.arn
}
