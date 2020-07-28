require 'rails_helper'

RSpec.describe "/users", type: :request do
  let(:request_params) { build(:user) }
  
  let(:invalid_user) { build(:user, :invalid_user) }

  describe "POST /signup" do
    context "パラメータに問題がない場合" do
      it "ユーザーの新規登録ができること" do
        post api_v1_sign_up_path, params: {email: request_params.email, password: request_params.password, token: request_params.token}
        expect(response).to have_http_status(200)
      end
    end

    context "emailが不正なパターンである場合" do
      it "ユーザーの新規登録ができないこと" do
        post api_v1_sign_up_path,
        params: {email: invalid_user.email, password: invalid_user.password, token: invalid_user.token}
        expect(response.status).to_not have_http_status(200)
      end

      
    end
    context "パスワードが６文字以下である場合" do
      it "ユーザーの新規登録ができないこと" do
          post api_v1_sign_up_path,
              params: {email: request_params.email, password: invalid_user.password, token: request_params.token}
          expect(response.status).not_to have_http_status(200)
      end
    end
  end
  describe "POST /login" do
    context "パラメータに問題がない場合" do
      let(:login_params) { create(:user, :login) }
      it "ユーザーのログインができること" do
        binding.pry
        post api_v1_login_path, params: {email: login_params.email, password: login_params.password }, headers: {Authorization: login_params.token }
        expect(response).to have_http_status(200)
      end
    end
  end
end
