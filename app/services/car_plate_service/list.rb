module CarPlateService
  class List < ApplicationService
    def initialize(params)
      @params = params
    end

    def call
      CarPlate.all
    end
  end
end
