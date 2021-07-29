require 'rails_helper'

RSpec.describe Project, type: :model do
  # ユーザー単位で重複したプロジェクト名を許可しないこと
  it "does not allow duplicate project names per user" do
    user = User.create(
      name:'joe',
      password:'tester'
    )
    user.projects.create(
      name:"テスト案件１"
    )
    new_project = user.projects.build(
      name:"テスト案件１"
    )
    new_project.valid?
    expect(new_project.errors[:name]).to include("はすでに存在します")
  end
  #二人のユーザーが同じ名前を使うことを許可すること
  it 'allows two users to share a project name' do
    user = User.create(
      name:'joe',
      password:'tester'
    )
    user.projects.create(
      name:"テスト案件１"
    )
    other_user = User.create(
      name:'sanny',
      password:'tester'
    )
    other_project = other_user.projects.build(
      name:"テスト案件１"
    )
    expect(other_project).to be_valid
  end
end
