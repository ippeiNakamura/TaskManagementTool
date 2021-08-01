require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user) { create(:user) }
  
  it "ユーザーがログインできること" ,:focus do
    expect {
      visit root_path
      fill_in "ユーザー名",with: user.name
      fill_in "パスワード名",with: user.name
      click_button "ロイン"
    }
    #現在のユーザー名がuser.nameであること
    expect(current_path).to 
  end
end