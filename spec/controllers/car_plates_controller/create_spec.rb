require 'rails_helper'

describe CarPlatesController do
  let(:invoke_action) { post :create, params: params }
  let(:params) { { car_plate: attributes_for(:car_plate) } }

  it 'returns a serialized instance of the requested record' do
    expect { invoke_action }.to change(CarPlate, :count).by(1)

    expect(response).to have_http_status(:found)
  end
end
