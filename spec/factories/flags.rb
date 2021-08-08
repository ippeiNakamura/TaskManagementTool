FactoryBot.define do
  factory :flag do
    sequence(:name) { |n| "ログイン機能の実装を完了する_#{n}" }
    association :work_target
  end
end
