require 'rails_helper'

RSpec.describe CarPlate, type: :model do
  describe 'validations' do
    context 'with presence' do
      it { is_expected.to validate_presence_of(:plate) }
    end
  end
end
