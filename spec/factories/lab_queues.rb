FactoryGirl.define do
  factory :lab_queue do
    users_count { 0 }
    date_of_lab { Faker::Date.between(49.days.ago, Date.today)}
  end
end
