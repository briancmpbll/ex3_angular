FactoryGirl.define do
  factory :character_attribute do
    association :character
    association :attribute_data, factory: :attribute
    value 1
  end
end
