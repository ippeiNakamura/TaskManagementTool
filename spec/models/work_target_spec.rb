require 'rails_helper'

RSpec.describe WorkTarget, type: :model do
  describe "name属性について" do
    let(:user) {create(:user)}
    let(:project) {create(:project,user: user)}
    let(:build_work_target) {build(:work_target,name:"売り上げ集計表作成ロボ",project: project)}
    let(:create_work_target) {create(:work_target,name:"売り上げ集計表作成ロボ",project: project)}
    
    context "nameが存在する場合" do
      it "有効であること" do
        expect(build_work_target).to be_valid
      end
    end
    context "nameが存在しない場合" do
      subject { page } 
      it "無効であること" do
        build_work_target.name = nil
        expect(build_work_target).to be_invalid

        build_work_target.name = ""
        expect(build_work_target).to be_invalid

        build_work_target.name = " "
        expect(build_work_target).to be_invalid
      end
    end
    context "nameが50文字以下の場合" do
         it "有効であること" do
            build_work_target.name = "a" * 50
            expect(build_work_target).to be_valid
         end
    end
    context "nameが51文字以上の場合" do
      it "無効であること" do
        build_work_target.name = "a" * 51
        expect(build_work_target).to be_invalid
        expect(build_work_target.errors[:name]).to include("50文字以内で入力してください")
      end
    end
    it "プロジェクト単位では、重複したnameを許可しないこと" do
      first_work_target = create_work_target
      second_work_target = build_work_target
      expect(second_work_target).to be_invalid
      expect(second_work_target.errors[:name]).to include("作業対象は既に存在します")  
    end
    it "二つのプロジェクトが、同じnameを使うことを許可すること" do
      first_work_target  = create_work_target
      second_user = user
      second_project = user.projects.create(name:"ホテル青木_OCR案件")
      second_work_target = second_project.work_targets.build(name:"売り上げ集計表作成ロボ")
      expect(second_work_target).to be_valid
    end
  end
end