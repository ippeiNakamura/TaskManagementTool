require 'rails_helper'

RSpec.describe Flag, type: :model do
  fdescribe "name属性について" do
    let(:user) {create(:user)}
    let(:project) {create(:project,user: user)}
    let(:work_target) {create(:work_target,project: project)}
    let(:build_flag) {build(:flag,name:"ログイン機能の実装を完了する",work_target: work_target)}
    let(:create_flag) {create(:flag,name:"ログイン機能の実装を完了する",work_target: work_target)}
    
    context "nameが存在する場合" do
      it "有効であること" do
        expect(build_flag).to be_valid
      end
    end
    context "nameが存在しない場合" do
      it "無効であること" do
        build_flag.name = nil
        expect(build_flag).to be_invalid

        build_flag.name = ""
        expect(build_flag).to be_invalid

        build_flag.name = " "
        expect(build_flag).to be_invalid
      end
    end
    context "nameが50文字以下の場合" do
         it "有効であること" do
            build_flag.name = "a" * 50
            expect(build_flag).to be_valid
         end
    end
    context "nameが51文字以上の場合" do
      it "無効であること" do
        build_flag.name = "a" * 51
        expect(build_flag).to be_invalid
        expect(build_flag.errors[:name]).to include("50文字以内で入力してください")
      end
    end
    it "プロジェクト単位では、重複したnameを許可しないこと" do
      first_flag = create_flag
      second_flag = build_flag
      expect(second_flag).to be_invalid
      expect(second_flag.errors[:name]).to include("フラグは既に存在します")  
    end
    it "二つ作業対象が、同じnameを使うことを許可すること" do
      first_flag  = create_flag
      second_user = user
      second_project = project
      second_work_target = second_project.work_targets.create(name:"報告書作成ロボ")
      second_flag = second_work_target.flags.create(name:"売り上げ集計表作成ロボ")
      second_flag = second_work_target.flags.build(name:"ログイン機能の実装を完了する")
      expect(second_flag).to be_valid
    end
  end
end
