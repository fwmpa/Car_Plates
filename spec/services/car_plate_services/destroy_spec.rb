require 'rails_helper'

describe CarPlateService::Destroy, type: %i[services car_plate] do
  describe '#call' do
    subject(:invoke_action) { described_class.call(car_plate) }

    let(:action_result) { invoke_action }

    let(:car_plate) { create(:car_plate) }

    context 'when all provided attributes are valid' do
      before { car_plate }

      it 'delete the car plate' do
        expect { invoke_action }.to change(CarPlate, :count).from(1).to(0)
        expect(action_result).to be_truthy
      end
    end

    context 'when some provided attributes are invalid' do
      context 'when plate is invalid' do
        let(:car_plate) { nil }

        it 'raises a record invalid exception' do
          expect { invoke_action }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end
  end
end
