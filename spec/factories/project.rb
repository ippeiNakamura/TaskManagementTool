FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "株式会社test_OCR案件_#{n}" }
    association :user
  end
end