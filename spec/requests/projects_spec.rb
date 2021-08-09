require 'rails_helper'

RSpec.describe "Projects", type: :request do
  describe "GET /show" do
    context "projectが存在する場合" do
      let(:user) {create(:user)}
      let(:project) {create(:project,user: user)}
      
      it "リクエストが成功すること" do
        get user_project_path user,Project
        expect(response).to have_http_status(200)
      end

      it "projectが表示されること" do
        get user_project_path user,Project
        expect(response.body).to include("株式会社test_OCR案件_1")
      end
      end
    end
  end
  