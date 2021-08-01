FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "taroo_#{n}" }
    password {"test1111"}
  end
end
