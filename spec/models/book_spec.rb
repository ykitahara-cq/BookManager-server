require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validatation' do
    context '存在チェック' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:price) }
      it { is_expected.to validate_presence_of(:purchase_date) }
      it { is_expected.to validate_presence_of(:image) }
    end
  end
end
