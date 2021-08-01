FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "jenny_#{n}" }
    password {"test1111"}
  end
end
