require 'rails_helper'

describe CarPlateService::Create, type: %i[services car_plates] do
  describe '#call' do
    subject(:car_plate_service) { described_class.call(attributes) }

    context 'when all provided attributes are valid' do
      let(:attributes) { attributes_for(:car_plate) }

      it 'creates a new car plate' do
        expect { car_plate_service }.to change(CarPlate, :count).from(0).to(1)
      end

      it 'return a car plate' do
        expect(car_plate_service).to be_a(CarPlate)
      end

      it 'contains sent attributes' do
        expect(car_plate_service).to have_attributes(attributes)
      end
    end

    context 'when some provided invalid attributes' do
      context 'when plate is empty' do
        let(:attributes) { attributes_for(:car_plate, plate: '') }

        it 'raises a record invalid exception' do
          expect { car_plate_service }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end

      context 'when provides existing plate regardless of capitalization' do
        let!(:car_plate) { create(:car_plate, plate: 'ABC1234') }
        let(:attributes) { attributes_for(:car_plate, plate: 'abc1234') }

        it 'raises a record invalid exception' do
          expect { car_plate_service }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end

      context 'when plate length is invalid' do
        let(:attributes) { attributes_for(:car_plate, plate: 'ABC12345') || attributes_for(:car_plate, plate: 'ABC') }

        it 'raises a record invalid exception' do
          expect { car_plate_service }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end

      context 'when year is not a number' do
        let(:attributes) { attributes_for(:car_plate, year: 'abcd') }

        it 'raises a record invalid exception' do
          expect { car_plate_service }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end
    end
  end
end
