require 'rails_helper'

RSpec.describe Project, type: :model do
  describe "attribute: name" do
    
    let(:build_project) {build(:project,name:"株式会社ABC＿RPA案件")}

    context "プロジェクト名が存在する場合は、" do
      it "有効であること" do
        expect(buiild_project).to be_valid
      end
    end
    context "プロジェクト名が存在しない場合" do
      it "無効であること" do
        expect(build_project).to be_invalid
      end
    end
  
    let!(:user){create(:user)}
    let!(:project){create(:project,user:user,name:"株式会社ABC_RPA案件")}

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
