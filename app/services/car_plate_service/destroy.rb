module CarPlateService
  class Destroy < ApplicationService
    def initialize(car_plate)
      @car_plate = car_plate
    end

    def call
      validate_car_plate
      @car_plate.destroy!
    end

    private

    def validate_car_plate
      raise(ActiveRecord::RecordNotFound) if @car_plate.blank?
    end
  end
end
