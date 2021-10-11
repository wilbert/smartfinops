FactoryBot.define do
  factory :cloud_stack do
    cloud_provider { 1 }
    cloud_provider_id { "MyString" }
    sla { 1.5 }
    score { 1.5 }
    status { 1 }
    product { nil }
  end
end
