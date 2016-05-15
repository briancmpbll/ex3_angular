FactoryGirl.define do
  factory :caste do
    transient do
      ability_count 5
    end

    sequence(:name) { |i| "Caste#{i}" }
    association :character_type

    after(:create) do |caste, evaluator|
      caste.abilities = create_list(:ability, evaluator.ability_count)
    end
  end
end
