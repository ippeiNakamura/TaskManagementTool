require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:project) {create(:project)}
  describe "attribute: name" do
    it "ユーザー単位で重複したプロジェクト名を許可しないこと" do
      #最初のプロジェクトを作成
      project
      #「最初のプロジェクト」と同じユーザーで、同一プロジェクトのモデルを生成
      second_porject = Project.build(projectfirst_project.name)
      second_porject.valid?
      expect(second_porject.errors[:name]).to include("はすでに存在します")
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
  
end
