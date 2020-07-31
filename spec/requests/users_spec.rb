require 'rails_helper'

RSpec.describe "/users", type: :request do
  let(:request_params) { build(:user) }
  let(:login_params) { create(:user, :login) }
  let(:invalid_user) { build(:user, :invalid_user) }

  describe "POST /signup" do
    subject { post api_v1_sign_up_path, params: params }
    context "パラメータに問題がない場合" do
      let(:params) {{email: request_params.email, password: request_params.password}}
      it "ユーザーの新規登録ができること" do
        expect(subject).to eq(200)
      end
    end

    context "パラメータに問題がある場合" do
      let(:params) {{email: invalid_user.email, password: invalid_user.password, token: invalid_user.token}}
      it "ユーザーの新規登録ができないこと" do
        expect(subject).to_not have_http_status(200)
      end
    end
  end

  describe "POST /login" do
    subject { post api_v1_login_path, params: params, headers: {Authorization: login_params.token} }
    context "パラメータが正常な場合" do
      let(:params) {{email: login_params.email, password: login_params.password}}
      it "ユーザーのログインができること" do
        expect(subject).to eq(200)
      end
    end

    context "パラメータに問題がある場合" do
      let(:params) {{email: login_params.email, password: invalid_user.password }}
      it "ログインができないこと" do
        expect(subject).to_not have_http_status(200)
      end
    end
  end
end
