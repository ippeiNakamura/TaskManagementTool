FactoryBot.define do
  factory :user do
    sequence　(:name){|n| "Taro_#{n}"}
    password {"test1111"}
  end
end
