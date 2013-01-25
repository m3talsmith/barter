# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    nickname 'testy'
    email 'testy@example.com'
    password 'password'
    password_confirmation 'password'
  end
end
