class CarPlate < ApplicationRecord
  self.primary_key = 'plate'
  validates :plate, uniqueness: { case_sensitive: false }, presence: true, length: { is: 7 }
  validates :year, numericality: { only_integer: true }, length: { is: 4 }, allow_blank: true

  before_save { plate.upcase! }
end
