module CarPlateService
  class Create < ApplicationService
    def initialize(attributes)
      @whitelisted_attributes = attributes.slice(*whitelist_attributes)
    end

    def call
      CarPlate.create!(@whitelisted_attributes)
    end

    private

    def whitelist_attributes
      %i[plate owner model year]
    end
  end
end
