FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "te_#{n}" }
    association :owner
  end
end
