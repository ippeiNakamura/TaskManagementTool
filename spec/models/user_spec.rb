require 'rails_helper'

RSpec.describe User, type: :model do
   let(:user) { build(:user,name: "TanakaHanako",password: "testtest123") }

   describe "attribute: name" do
      context "nameが存在している場合" do
         it "有効であること" do
            expect(user).to be_valid
         end
      end
      context "nameが存在していない場合" do
         it "無効であること" do
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
      context "nameが50文字以下の場合" do
         it "有効であること" do
            user.name = "a" * 50
            expect(user).to be_valid
         end
      end
      context "nameが51文字以上の場合" do
         it "無効であること" do
            user.name = "a" * 51
            expect(user).to be_invalid
            expect(user.errors[:name]).to include("50文字以内で入力してください")
         end
      end   
      context "ユーザー名が既に登録されていた場合" do
         it "無効であること" do
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