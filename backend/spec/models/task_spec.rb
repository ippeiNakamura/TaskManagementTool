require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "name属性について" do
    let(:user) {create(:user)}
    let(:project) {create(:project,user: user)}
    let(:work_target) {create(:work_target,project: project)}
    let(:flag) {create(:flag,work_target: work_target)}
    let(:build_task) {build(:task,name:"前処理の実装",flag: flag)}
    let(:create_task) {create(:task,name:"前処理の実装",flag: flag)}
    
    context "nameが存在する場合" do
      it "有効であること" do
        expect(build_task).to be_valid
      end
    end
    context "nameが存在しない場合" do
      it "無効であること" do
        build_task.name = nil
        expect(build_task).to be_invalid

        build_task.name = ""
        expect(build_task).to be_invalid

        build_task.name = " "
        expect(build_task).to be_invalid
      end
    end
    context "nameが50文字以下の場合" do
         it "有効であること" do
            build_task.name = "a" * 50
            expect(build_task).to be_valid
         end
    end
    context "nameが51文字以上の場合" do
      it "無効であること" do
        build_task.name = "a" * 51
        expect(build_task).to be_invalid
        expect(build_task.errors[:name]).to include("50文字以内で入力してください")
      end
    end
    it "プロジェクト単位では、重複したnameを許可しないこと" do
      first_task = create_task
      second_task = build_task
      expect(second_task).to be_invalid
      expect(second_task.errors[:name]).to include("タスクは既に存在します")  
    end
    it "二つ作業対象が、同じnameを使うことを許可すること" do
      first_task  = create_task
      second_user = user
      second_project = project
      second_work_target = work_target
      second_flag = second_work_target.flags.create(name:"料金入力ロボ")
      second_task = second_flag.tasks.build(name:"前処理の実装")
      expect(second_task).to be_valid
    end
  end
end
