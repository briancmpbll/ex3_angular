FactoryGirl.define do
  factory :specialty do
    description 'Being cool'
    association :character_ability
  end
end
