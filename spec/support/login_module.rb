module LoginModule
  def login(user)
    visit root_path
    save_and_open_page
    fill_in "ユーザー名",with: user.name
    fill_in "パスワード名",with: user.name
    click_button "afda"
  end
end