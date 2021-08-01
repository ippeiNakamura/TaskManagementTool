require 'rails_helper'

RSpec.describe User, type: :model do
 #有効なファクトリを持つこと
 it "has a valid factory" do
  expect(FactoryBot.build(:user)).to be_valid
 end
 #ユーザー名、パスワードが有れば有効な状態であること
 it "is valid with user name,test name email and password" do
    expect(FactoryBot.build(:user)).to be_valid 
 end
 #ユーザー名がなければ無効な状態であること
 it "is invalid without a name" do
  user = FactoryBot.build(:user,name: nil)
  user.valid?
  expect(user.errors[:name]).to include("を入力してください")
 end
 it "重複するユーザー名は無効な状態であること" do
  first_user = FactoryBot.create(:user)
  next_user = FactoryBot.build(:user,name:first_user.name )
  next_user.valid?
  expect(next_user.errors[:name]).to include("はすでに存在します")
 end 
end