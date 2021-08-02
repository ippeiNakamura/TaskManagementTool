require 'rails_helper'

RSpec.describe User, type: :model do
   let(:user) { build(:user,name: "TanakaHanako",password: "testtest123") }

   describe "attribute: name" do
      #nameが存在している場合は、有効であること
      context "when name is present" do
         it "is valid" do
            expect(user).to be_valid
         end
      end
      #nameが存在していない場合は、無効であること
      context "when name is not present" do
         it "is invalid" do
            user.name = nil
            expect(user).to be_invalid
            expect(user.errors[:name]).to include("を入力してください")

            user.name = ''
            expect(user).to be_invalid
            expect(user.errors[:name]).to include("を入力してください")

            user.name = '　'
            expect(user).to be_invalid
            expect(user.errors[:name]).to include("を入力してください")                
         end
      end
      #nameが50文字以下の場合は、有効であること
      context "when name length is than 50 characters or less" do
         it "is valid" do
            user.name = "a" * 50
            expect(user).to be_valid
         end
      end
      #nameが51文字以上の場合は、無効であること
      context "when name length is than 51 characters or further" do
         it "is invalid" do
            user.name = "a" * 51
            expect(user).to be_invalid
            expect(user.errors[:name]).to include("50文字以内で入力してください")
         end
      end
      #ユーザー名が既に登録されていた場合は、無効であること
      context "When name is already　registered" do
         it "is invalid " do
            create(:user,name: "Tom")
            user.name = "Tom"
            expect(user).to be_invalid
            expect(user.errors[:name]).to include("はすでに存在します")
         end
      end
      #ユーザー名、パスワードが有れば有効な状態であること
      #it "is valid with user name,test name email and password" do
      #expect(FactoryBot.build(:user)).to be_valid 
      #end      
   end
end