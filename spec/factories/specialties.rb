FactoryGirl.define do
  factory :specialty do
    sequence(:description) { |i| "Specialty#{i}" }
    association :character_ability
  end
end
