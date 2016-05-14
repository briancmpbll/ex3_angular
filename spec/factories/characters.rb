FactoryGirl.define do
  factory :character do
    sequence(:name) { |i| "Character#{i}" }
    concept 'An awesome character'
    association :caste
    willpower { rand(1..10) }
    essence { rand(1..5) }
    player 'George'
    anima 'Sick light show'

    after(:create) do |character|
      create_list(:character_attribute, 9, character: character)
      create_list(:character_ability, 10, character: character)
    end
  end
end
