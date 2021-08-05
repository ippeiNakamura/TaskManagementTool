require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:project) {build(:project,name:"株式会社ABC＿RPA案件")}
  describe "attribute: name" do
    #プロジェクト名が存在する場合は、有効であること
    context "when name is present" do
      fit "is valid" do
        expect(project).to be_valid
      end
    end
    #プロジェクト名が存在しない場合は、無効であること
    context "when name is not present" do
      fit "is invalid" do
        expect(project).to be_invalid
      end
    end
  end
  
  let(:project) {create(:project)}
  describe "attribute: name" do
    it "ユーザー単位で重複したプロジェクト名を許可しないこと" do
      最初のプロジェクトを作成
      project
      「最初のプロジェクト」と同じユーザーで、同一プロジェクトのモデルを生成

      expect(project).to be_invalid
      expect(porject.errors[:name]).to include("はすでに存在します")
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
