require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:project) {build(:project)}
  let(:user){create(:user)}
  let(:project){create(:project)}

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
    it "does not allow duplicate project names per user" do
      user
      user.projects.create(name:"株式会社ABC_RPA案件")
      new_project = user.projects.build(name:"株式会社ABC_RPA案件")
      new_project.valid?
      expect(new_project.errors[:name]).to include("プロジェクト名は既に存在します")  
    end
    #二人のユーザーが、同じプロジェクト名を使うことを許可すること
    fit "allows two users to share a project name" do
      first_user = user
      second_user = create(:user,name:"工藤真一")
      first_user.projects.create(name:"株式会社ABC_RPA案件")
      second_project = second_user.projects.build(name:"株式会社ABC_RPA案件")
      binding.pry
      expect(second_project).to be_valid
    end
  end
end
