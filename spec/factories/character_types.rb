FactoryGirl.define do
  factory :character_type do
    sequence(:name) { |i| "CharacterType#{i}" }

    factory :character_type_with_castes do
      transient do
        caste_count 5
      end

      after(:create) do |type, evaluator|
        create_list(:caste, evaluator.caste_count,
                    character_type: type)
      end
    end
  end
end
