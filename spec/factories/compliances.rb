FactoryBot.define do
  factory :compliance do
    rule_name { "MyString" }
    weight { 1.5 }
    deadline { "2021-10-13 14:54:18" }
    required_by_law { false }
  end
end
