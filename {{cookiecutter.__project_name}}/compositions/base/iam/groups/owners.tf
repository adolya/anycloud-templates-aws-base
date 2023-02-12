# module "policies" {
#   source = "../policies"
# }


# resource "aws_iam_group" "owners" {
#   name = "Admins"
# }

# resource "aws_iam_group_policy_attachment" "owner_full_access" {
#   group      = aws_iam_group.admins.name
#   policy_arn =  module.policies.standard_policies.admin_full_access.arn
# }

# resource "aws_iam_group_policy_attachment" "billing_full_access" {
#   group      = aws_iam_group.admins.name
#   policy_arn =  module.policies.standard_policies.billing_full_access.arn
# }
