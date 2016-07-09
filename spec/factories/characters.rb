FactoryGirl.define do
  factory :character do
    sequence(:name) { |i| "Character#{i}" }
    concept 'An awesome character'
    association :caste
    willpower { rand(1..10) }
    essence { rand(1..5) }
    player 'George'
    anima 'Sick light show'
    association :supernal_ability, factory: :ability

    after(:create) do |character|
      create_list(:character_attribute, 9, character: character)
      create_list(:character_ability, 5, character: character)
      create_list(:favored_character_ability, 5, character: character)
    end
  end
end
