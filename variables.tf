# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "users" {
  type        = list(string)
  description = "A list whose values are the usernames of each user that is allowed to manage assessment images. Example: [\"firstname1.lastname1\", \"firstname2.lastname2\", \"firstname3.lastname3\"]"
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "assessment_images_managers_group_name" {
  type        = string
  description = "The base name of the group to be created for assessment images manager users in each Images account. This value has the current workspace name appended to it before use."
  default     = "assessment_images_managers"
}

variable "assume_images_assessmentimagesbucketfullaccess_policy_description" {
  type        = string
  description = "The description to associate with the IAM policy that allows assumption of the role that allows full access to the assessment images bucket in an Images account."
  default     = "The IAM policy that allows assumption of the role that allows full access to the assessment images bucket in an Images account."
}

variable "assume_images_assessmentimagesbucketfullaccess_policy_name" {
  type        = string
  description = "The base name to assign the IAM policies that allow assumption of the role that allows full access to the assessment images bucket in an Images account. This value has the current workspace name appended to it before use."
  default     = "Images-AssumeAssessmentImagesBucketFullAccess"
}

variable "aws_region" {
  type        = string
  description = "The AWS region to deploy into (e.g. us-east-1)."
  default     = "us-east-1"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created."
  default     = {}
}
