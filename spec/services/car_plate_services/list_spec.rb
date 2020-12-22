require 'rails_helper'

describe CarPlateService::List, type: %i[services car_plates] do
  describe '#call' do
    subject(:car_plate_service) { described_class.call(attributes) }

    let(:attributes) { {} }

    context 'when have car plate' do
      let(:car_plate_1) { create(:car_plate, plate: 'ABC1234') }
      let(:car_plate_2) { create(:car_plate, plate: 'ABC1235') }
      let(:car_plate_3) { create(:car_plate, plate: 'ABC1236') }

      it 'list all car plates' do
        expected_result = [car_plate_1, car_plate_2, car_plate_3]
        expect(car_plate_service).to match_array(expected_result)
      end

      context 'when have filter' do
        let(:attributes) { { plate: car_plate_1.plate } }

        it 'car has plate' do
          expected_result = [car_plate_1]
          expect(car_plate_service).to eq(expected_result)
        end
      end
    end

    context 'when doesnt have a car plate' do
      it 'is empty' do
        expect(car_plate_service).to eq([])
      end
    end
  end
end
