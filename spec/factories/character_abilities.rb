FactoryGirl.define do
  factory :character_ability do
    transient do
      specialty_count 0
    end

    association :character
    association :ability
    value { rand(0..5) }
    favored false

    after(:create) do |ability, evaluator|
      create_list(:specialty, evaluator.specialty_count,
                  character_ability: ability)
    end
  end
end
