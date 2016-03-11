FactoryGirl.define do
  factory :user do
    sequence(:username) { |i| "user#{i}" }
    sequence(:email) { |i| "email#{i}@email.com" }
    password 'abcd1234'
    password_confirmation 'abcd1234'
  end
end
