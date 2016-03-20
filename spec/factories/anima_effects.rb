FactoryGirl.define do
  factory :anima_effect do
    condition 'Spend 2 motes'
    effect 'Kill everything'

    factory :type_anima_effect do
      association :owner, factory: :character_type
    end

    factory :caste_anima_effect do
      association :owner, factory: :caste
    end
  end
end
