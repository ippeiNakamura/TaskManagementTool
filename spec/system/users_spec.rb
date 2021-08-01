require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user) { create(:user) }
  
  it "ユーザーがログインできること" ,:focus do
    
    #現在のユーザー名がuser.nameであること
    expect(current_path).to 
  end
end