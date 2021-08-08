FactoryBot.define do
  factory :work_target do
    sequence(:name) { |n| "売り上げ集計表作成ロボ_#{n}" }
    association :project
  end
end
