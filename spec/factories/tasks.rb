FactoryBot.define do
  factory :task do
    sequence(:name) { |n| "前処理の実装#{n}" }
    association :flag
  end
end
