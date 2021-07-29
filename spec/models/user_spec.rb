require 'rails_helper'

RSpec.describe User, type: :model do
 #有効なファクトリを持つこと
 it "has a valid factory" do
  expect(FactoryBot.build(:user)).to be_valid
 end
 #ユーザー名、パスワードが有れば有効な状態であること
 it "is valid with user name,test name email and password" do
    user = User.new(
      name:"test",
      password:"test"
    )
    expect(user).to be_valid 
 end
 #ユーザー名がなければ無効な状態であること
 it "is invalid without a name" do
  user = User.new(
    name: nil,
    password:'test123'
    )
  user.valid?
  expect(user.errors[:name]).to include("を入力してください")
 end
end