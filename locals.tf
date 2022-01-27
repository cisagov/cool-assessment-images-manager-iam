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

  # Create the assessment images managers group name for each system environment.
  assessment_images_managers_group_name = { for e in var.system_environments : e => format("%s-%s", var.assessment_images_managers_group_name, e) }

  # Create a map whose keys are each system environment and its values are a list
  # of users to give access to in that environment.
  assessment_images_managers = { for e in var.system_environments : e => toset([for u, a in var.users : u if contains(a, e)]) }
}
