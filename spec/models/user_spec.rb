require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  let(:invalid_user) {build(:user, :invalid_user)}
  describe 'validatation' do 
    context '存在チェック' do
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_presence_of(:password) }
    end

    context '文字数チェック' do
      it { should validate_length_of(:password).
        is_at_least(6)}
    end

    context 'フォーマットチェック' do
      it "emailのvalidateが正しく機能しているか" do
        expect(invalid_user).to be_invalid
      end
    end
  end
end
