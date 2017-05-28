FactoryGirl.define do
  factory :schedule do
    subject { Faker::Company.name }
    subgroup { Faker::Number.number( { min: 0, max: 2 } ) }
    time { '18:45-20:20' }
  end
end
