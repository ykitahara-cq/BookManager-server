require 'rails_helper'

RSpec.describe Book, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe 'validatation' do 
    context '存在チェック' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:price) }
      it { is_expected.to validate_presence_of(:purchase_date) }
      it { is_expected.to validate_presence_of(:image) }
    end
  end
end
