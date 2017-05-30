FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    password "password"
    password_confirmation "password"
    confirmed_at Date.today
  end
end
