require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user){create(:user,name:"TanakaTakesi",password:"aiueo12345") }
    it "ユーザーがログインできること" do
      #現在のユーザー名がuser.nameであること
      expect(sign_in_as user)
    end
end