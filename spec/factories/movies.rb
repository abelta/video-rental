require "faker"

FactoryGirl.define do

  factory :movie do
    title { Faker::Lorem.sentence }
    synopsis { Faker::Lorem.paragraph }
  end

end
