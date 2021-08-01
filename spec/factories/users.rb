FactoryBot.define do
  factory :user, aliases:[:owner] do
    sequence(:name) { |n| "j_#{n}" }
    password {"test1111"}
  end
end
