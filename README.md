# cool-assessment-images-manager-iam #

[![GitHub Build Status](https://github.com/cisagov/cool-assessment-images-manager-iam/workflows/build/badge.svg)](https://github.com/cisagov/cool-assessment-images-manager-iam/actions)

This project is used to manage IAM permissions for COOL users that are allowed
to manage the objects stored in the S3 bucket created in
[cisagov/cool-images-assessment-images](https://github.com/cisagov/cool-images-assessment-images).

## Pre-requisites ##

- [Terraform](https://www.terraform.io/) installed on your system.
- An accessible AWS S3 bucket to store Terraform state
  (specified in [backend.tf](backend.tf)).
- An accessible AWS DynamoDB database to store the Terraform state lock
  (specified in [backend.tf](backend.tf)).
- Access to all of the Terraform remote states specified in
  [remote_states.tf](remote_states.tf).
- The following COOL accounts and roles must have been created:
  - Users:
    [`cisagov/cool-accounts/users`](https://github.com/cisagov/cool-accounts/tree/develop/users)
- User accounts for all users must have been created previously. We
  recommend using the
  [`cisagov/cool-users-non-admin`](https://github.com/cisagov/cool-users-non-admin)
  repository to create users.
- Terraform in
  [`cisagov/cool-images-assessment-images`](https://github.com/cisagov/cool-images-assessment-images)
  must have been applied.

## Usage ##

1. Create a Terraform workspace (if you haven't already done so) by running
   `terraform workspace new <workspace_name>`
1. Create a `<workspace_name>.tfvars` file with all of the required
  variables (see [Inputs](#inputs) below for details):

  ```hcl
  users = []
    "firstname1.lastname1",
    "firstname2.lastname2",
    "firstname3.lastname3",
  ]
  ```

1. Run the command `terraform init`.
1. Run the command `terraform apply
  -var-file=<workspace_name>.tfvars`.

## Requirements ##

| Name | Version |
|------|---------|
| terraform | ~> 1.0 |
| aws | ~> 3.38 |

## Providers ##

| Name | Version |
|------|---------|
| aws | ~> 3.38 |
| aws.users | ~> 3.38 |
| terraform | n/a |

## Modules ##

No modules.

## Resources ##

| Name | Type |
|------|------|
| [aws_iam_group.assessment_images_managers](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_policy_attachment.assume_images_assessmentimagesbucketfullaccess_role_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_policy.assume_images_assessmentimagesbucketfullaccess_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_user_group_membership.assessment_images_managers](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_group_membership) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume_images_assessmentimagesbucketfullaccess_role_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_user.users](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_user) | data source |
| [terraform_remote_state.assessment_images](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.users](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| assessment\_images\_managers\_group\_name | The base name of the group to be created for assessment images manager users in each Images account. This value has the current workspace name appended to it before use. | `string` | `"assessment_images_managers"` | no |
| assume\_images\_assessmentimagesbucketfullaccess\_policy\_description | The description to associate with the IAM policy that allows assumption of the role that allows full access to the assessment images bucket in an Images account. | `string` | `"The IAM policy that allows assumption of the role that allows full access to the assessment images bucket in an Images account."` | no |
| assume\_images\_assessmentimagesbucketfullaccess\_policy\_name | The base name to assign the IAM policies that allow assumption of the role that allows full access to the assessment images bucket in an Images account. This value has the current workspace name appended to it before use. | `string` | `"Images-AssumeAssessmentImagesBucketFullAccess"` | no |
| aws\_region | The AWS region to deploy into (e.g. us-east-1). | `string` | `"us-east-1"` | no |
| tags | Tags to apply to all AWS resources created. | `map(string)` | `{}` | no |
| users | A list whose values are the usernames of each user that is allowed to manage assessment images. Example: ["firstname1.lastname1", "firstname2.lastname2", "firstname3.lastname3"] | `list(string)` | n/a | yes |

## Outputs ##

No outputs.

## Notes ##

Running `pre-commit` requires running `terraform init` in every directory that
contains Terraform code. In this repository, this is just the main directory.

## Contributing ##

We welcome contributions!  Please see [`CONTRIBUTING.md`](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
