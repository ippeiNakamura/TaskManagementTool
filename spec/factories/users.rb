FactoryBot.define do
  factory :user, aliases:[:owner] do
    sequence(:name) { |n| "田中花子_#{n}" }
    password {"test1111"}
  end
end
