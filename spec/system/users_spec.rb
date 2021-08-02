require 'rails_helper'

RSpec.describe "Users", type: :system do
    it "ユーザーがログインできること" do
      #現在のユーザー名がuser.nameであること
      expect(sign_in_as user)
    end
end