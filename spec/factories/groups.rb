FactoryGirl.define do
  factory :group do
    name { Faker::Number.number(6).to_s }
    id_of_group { Faker::Number.number(5) }
    course { Faker::Number.number(1) }
  end
end