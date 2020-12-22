module CarPlateService
  class Update < ApplicationService
    def initialize(car_plate, attributes)
      @car_plate = car_plate
      @whitelisted_attributes = attributes.slice(*whitelist_attributes)
    end

    def call
        @car_plate.update!(@whitelisted_attributes)
        @car_plate
    end

    private

    def whitelist_attributes
      %i[plate owner model year]
    end
  end
end
