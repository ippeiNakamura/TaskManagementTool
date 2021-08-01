module LoginSupport
    visit root_path
    fill_in "ユーザー名",with: user.name
    fill_in "パスワード名",with: user.name
    click_button "ロイン"
end