require 'rails_helper'

RSpec.describe Project, type: :model do
  
  let(:project) {build(:project,name:'株式会社ABC_RPA案件')}
  
  describe "attribute: name" do
    #プロジェクト名存在する場合、有効であること
    context "when name is present" do
      it "is valid" do
        expect(project).to be_valid
      end
      end
    #プロジェクト名が存在しない場合、無効であること
    context "when name is not present" do
      it "is invalid" do
        project.name = ''
        expect(project).to be_invalid
        expect(project.errors[:name]).to include("を入力してください")
      end
    end
    #ユーザー単位では、重複したプロジェクト名を許可しないこと
    fit "does not allow duplicate project names per user" do
      user = create(:user,name:'田中二郎')
      user.projects.create(name:"株式会社ABC_RPA案件")
      new_project = user.projects.build(name:"株式会社ABC_RPA案件")
      new_project.valid?
      expect(new_project.errors[:name]).to include("プロジェクト名は既に存在します")  
    end
    
    #ユーザー間で、同じプロジェクト名の場合は、有効であること
    #it　"" do
    #second_porject = Project.build(projectfirst_project.name)
    #second_porject.valid?
    #expect(second_porject.errors[:name]).to include("はすでに存在します")
    #end
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
