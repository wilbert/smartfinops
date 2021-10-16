# role_credentials = Aws::AssumeRoleCredentials.new(
#   client: Aws::STS::Client.new,
#   role_arn: "linked::account::arn",
#   role_session_name: "session-name"
# )
#
#
# Aws.config.update(
#   {
#     credentials: role_credentials,
#     region: 'us-east-1'
#   })
