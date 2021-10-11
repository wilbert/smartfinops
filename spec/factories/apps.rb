FactoryBot.define do
  factory :app do
    name { "MyString" }
    is_active { false }
    critical_level { 1 }
    is_internal { false }
    business_alias { "MyString" }
    repository_url { "MyString" }
    app_tags { "MyString" }
    owner { nil }
  end
end
