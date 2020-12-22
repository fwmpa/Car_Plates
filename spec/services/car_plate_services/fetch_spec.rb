require 'rails_helper'

describe CarPlateService::Fetch, type: %i[services car_plate] do
  describe '#call' do
    subject(:car_plate_service) { described_class.call(plate) }

    let(:car_plate) { create(:car_plate) }
    let(:plate) { car_plate.id }

    context 'when car plate exist' do
      it 'return the car plate' do
        expect(car_plate_service).to eq(car_plate)
      end
    end

    context 'when car plate is not found' do
      let(:plate) { 0 }

      it 'raises a record not found exception' do
        expect { car_plate_service }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
