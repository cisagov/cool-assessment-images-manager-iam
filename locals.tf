# ------------------------------------------------------------------------------
# Retrieve the effective Account ID, User ID, and ARN in which Terraform is
# authorized.  This is used to calculate the session names for assumed roles.
# ------------------------------------------------------------------------------
data "aws_caller_identity" "current" {}

# ------------------------------------------------------------------------------
# Evaluate expressions for use throughout this configuration.
# ------------------------------------------------------------------------------
locals {
  # Extract the user name of the current caller for use
  # as assume role session names.
  caller_user_name = split("/", data.aws_caller_identity.current.arn)[1]

  # Create the assessment images managers group name.
  assessment_images_managers_group_name = format("%s-%s", var.assessment_images_managers_group_name, terraform.workspace)

  # Create the AssessmentImagesBucketFullAccess assumption policy name.
  assume_assessmentimagesbucketfullaccess_policy_name = format("%s-%s", var.assume_images_assessmentimagesbucketfullaccess_policy_name, terraform.workspace)

  # Get the unique values in var.users.
  users = toset(var.users)
}
