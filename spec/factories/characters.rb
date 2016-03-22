FactoryGirl.define do
  factory :character do
    sequence(:name) { |i| "Character#{i}" }
    concept 'An awesome character'
    association :caste
    willpower { rand(1..10) }
    essence { rand(1..5) }
  end
end
