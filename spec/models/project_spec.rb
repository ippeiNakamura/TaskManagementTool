require 'rails_helper'

RSpec.describe Project, type: :model do
  let!(:user){create(:user)}
  let!(:project){create(:project,user:user,name:"株式会社ABC_RPA案件")}

  describe "attribute: name" do
    it "ユーザー単位では、重複したプロジェクト名を許可しないこと" do
      second_project = user.projects.build(name:"株式会社ABC_RPA案件")
      expect(second_project).to be_invalid
      expect(second_project.errors[:name]).to include("プロジェクト名は既に存在します")  
    end
    it "二人のユーザーが、同じ名前を使うことを許可すること" do
      second_user = create(:user,name:"工藤真一")
      second_project = second_user.projects.build(name:"株式会社ABC_RPA案件")
      expect(second_project).to be_valid
    end
    
  end
end
