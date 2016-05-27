FactoryGirl.define do
  factory :character_ability do
    association :character
    association :ability
    value { rand(0..5) }
    favored false

    factory :favored_character_ability do
      favored true
    end
  end
end
