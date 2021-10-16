FactoryBot.define do
  factory :cloud_resource do
    identifier { "MyString" }
    service { "MyString" }
    name { "MyString" }
    service_type { "MyString" }
    region { "MyString" }
    correct_app_tag { "MyString" }
    app_env { "MyString" }
    cloud_stack { nil }
  end
end
