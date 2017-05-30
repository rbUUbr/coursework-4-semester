FactoryGirl.define do
  factory :schedule do
    subject { Faker::Company.name }
    subgroup { Faker::Number.number(1) }
    week { Faker::Number.number(1) }
    time { '18:45-20:20' }
    weeks_day { 'Wednesday' }
    after(:create) do |schedule|
      create_list(:lab_queue, 2, schedule: schedule)
    end
  end
  factory :invalid_schedule do
  end
end
