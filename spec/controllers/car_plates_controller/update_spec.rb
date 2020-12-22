require 'rails_helper'

describe CarPlatesController do
  let(:car_plate) { create(:car_plate) }

  let(:attributes) { attributes_for(:car_plate) }

  let(:params) do
    {
      plate: car_plate.plate,
      car_plate: attributes
    }
  end

  let(:invoke_action) { put :update, params: params }

  context 'with valid attributes' do
    before do
      invoke_action
    end

    it 'returns a instance of the requested record' do
      expect(response).to have_http_status(:redirect)
    end

    it 'update car plate and dependences' do
      expected_attributes = attributes.stringify_keys
      new_attributes = car_plate.reload.attributes.slice(*expected_attributes.keys)

      expect(new_attributes).to eq(expected_attributes)
    end
  end
end
