FactoryBot.define do
  factory :work_target do

    sequence(:name) { |n| "報告書作成ロボ＿#{n}" }

    association :project
  end
end
