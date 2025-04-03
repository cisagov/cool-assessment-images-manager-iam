# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "terraform_state_bucket" {
  description = "The name of the S3 bucket where Terraform state is stored."
  nullable    = false
  type        = string
}

variable "users" {
  description = "A list of usernames that are allowed to manage assessment images. Example: [ \"firstname1.lastname1\", \"firstname2.lastname2\", \"firstname3.lastname3\" ]"
  nullable    = false
  type        = list(string)
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "assessment_images_managers_group_name" {
  default     = "assessment_images_managers"
  description = "The name of the group to be created for assessment images manager users in the Images account."
  nullable    = false
  type        = string
}

variable "assume_images_assessmentimagesbucketfullaccess_policy_description" {
  default     = "The IAM policy that allows assumption of the role that allows full access to the assessment images bucket in an Images account."
  description = "The description to associate with the IAM policy that allows assumption of the role that allows full access to the assessment images bucket in an Images account."
  nullable    = false
  type        = string
}

variable "assume_images_assessmentimagesbucketfullaccess_policy_name" {
  default     = "Images-AssumeAssessmentImagesBucketFullAccess"
  description = "The name to assign the IAM policy that allows assumption of the role that allows full access to the assessment images bucket in the Images account."
  nullable    = false
  type        = string
}

variable "aws_region" {
  default     = "us-east-1"
  description = "The AWS region to deploy into (e.g. us-east-1)."
  nullable    = false
  type        = string
}

variable "tags" {
  default     = {}
  description = "Tags to apply to all AWS resources created."
  nullable    = false
  type        = map(string)
}
