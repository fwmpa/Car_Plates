module CarPlateService
  class Fetch < ApplicationService
    def initialize(plate)
      @plate = plate
    end

    def call
      CarPlate.find(@plate)
    end
  end
end
