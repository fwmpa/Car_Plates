FactoryBot.define do
  factory :car_plate do
    plate { 'ABC1234' }
    owner { Faker::Name.name }
    model { Faker::Vehicle.model }
    year { Faker::Vehicle.year }
  end
end
