require 'rails_helper'

describe CarPlateService::Update, type: %i[services car_plate] do
  describe '#call' do
    subject(:invoke_action) { described_class.call(car_plate, attributes) }

    let(:action_result) { invoke_action }

    let(:attributes) { attributes_for(:car_plate) }
    let(:attributes_key) { attributes.stringify_keys.keys }

    let(:car_plate) { create(:car_plate) }

    context 'when all provided attributes are valid' do
      before { invoke_action }

      it 'updates the Car Plate' do
        new_attributes = action_result.attributes.slice(*attributes_key)
        expected_attributes = attributes.stringify_keys

        expect(new_attributes).to eq(expected_attributes)
      end

      it 'return a Car Plate' do
        expect(action_result).to be_a(CarPlate)
      end
    end

    context 'when some provided attributes are invalid' do
      context 'when year is invalid' do
        let(:attributes) { attributes_for(:car_plate, year: '201') }

        it 'raises a record invalid exception' do
          expect { invoke_action }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end
    end
  end
end
