FactoryBot.define do
  factory :cloud_resource do
    resource_name { "MyString" }
    resource_id { "MyString" }
    resource_type { "MyString" }
    resource_creation_time { "MyString" }
    cloud_provider { 1 }
    cloud_provider_id { "MyString" }
    aws_arn { "MyString" }
    relationships { "" }
  end
end
