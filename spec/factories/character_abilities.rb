FactoryGirl.define do
  factory :character_ability do
    association :character
    association :ability
    value { rand(0..5) }
  end
end
